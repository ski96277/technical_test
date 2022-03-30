import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teamleance_technecal_test/pref/pref_const.dart';
import 'package:teamleance_technecal_test/routes/app_routes.dart';
import 'package:teamleance_technecal_test/utils/app_utils.dart';
import 'package:teamleance_technecal_test/utils/color_const.dart';
import 'package:teamleance_technecal_test/utils/key_word.dart';
import 'package:teamleance_technecal_test/utils/text_style.dart';
import 'package:teamleance_technecal_test/viewModel/login_vm.dart';
import 'package:teamleance_technecal_test/widget/custom_button.dart';
import 'package:teamleance_technecal_test/widget/loading_overlay.dart';
import 'package:teamleance_technecal_test/widget/my_text_form_field.dart';
import 'package:teamleance_technecal_test/widget/signup_here_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginVM>(builder: (loginVm) {
      return Scaffold(
        backgroundColor: ColorConst.whiteColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: AppUtils.getH(context),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.supervised_user_circle_rounded,
                    size: 94,
                    color: ColorConst.lightGreen,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "loginTitle".tr,
                    style: getTextStyleBold(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "signupSubTitle".tr,
                    style: getTextStyleNormal(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: loginVm.formKeyLogin,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MyTextFormField(
                            controller: loginVm.emailController,
                            hintText: "emailHint".tr,
                            labelText: "emailHint".tr,
                            onSaved: (onSaved) {},
                            validator: (validator) {
                              if (validator == null || validator.isEmpty) {
                                return "emailHint".tr;
                              }
                              if (AppUtils.isEmailNotValidate(validator)) {
                                return "validEmailError".tr;
                              }
                              return null;
                            },
                            callBackPasswordView: (callBackPasswordView) {}),
                        const SizedBox(
                          height: 20,
                        ),
                        MyTextFormField(
                            isPassword: loginVm.isPassword,
                            showEyeIcon: true,
                            controller: loginVm.passwordController,
                            hintText: "passwordHint".tr,
                            labelText: "passwordHint".tr,
                            onSaved: (onSaved) {},
                            validator: (validator) {
                              if (validator == null || validator.isEmpty) {
                                return "passwordHint".tr;
                              }
                              return null;
                            },
                            callBackPasswordView: (callBackPasswordView) {
                              loginVm.isPassword = !loginVm.isPassword;
                              loginVm.update();
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        SignUpHereText(
                          callback: (callback) {
                            // Get.offAllNamed(AppRoutes.registerScreen);
                          },
                          firstText: "forgotPassword".tr,
                          secondText: "reset".tr,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoadingOverlay(
                          isLoading: loginVm.loadingLogin,
                          child: CustomButton(
                              callBack: (callBack) {
                                if (loginVm.formKeyLogin.currentState!.validate()) {
                                  loginVm.loadingLogin = true;
                                  loginVm.update();

                                  loginVm.authHandler.handleSignInEmail(loginVm.emailController.text, loginVm.passwordController.text).then((value) {
                                    Pref.setValue(KeyWordFile.userID, value.uid);
                                    Get.offAllNamed(AppRoutes.homeScreen);

                                    loginVm.loadingLogin = false;
                                    loginVm.update();
                                  }).catchError((e) {
                                    AppUtils.showSnakeBar(context: context, msg: "signUpError".tr);
                                    loginVm.loadingLogin = false;
                                    loginVm.update();
                                    debugPrint(" sign up error =  $e");
                                  });
                                }
                              },
                              text: "login".tr),
                        ),
                        Center(
                          child: SignUpHereText(
                            callback: (callback) {
                              Get.offAllNamed(AppRoutes.registerScreen);
                            },
                            firstText: "noAccount".tr,
                            secondText: "signUp".tr,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
