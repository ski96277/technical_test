import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teamleance_technecal_test/pref/pref_const.dart';
import 'package:teamleance_technecal_test/routes/app_routes.dart';
import 'package:teamleance_technecal_test/utils/app_utils.dart';
import 'package:teamleance_technecal_test/utils/color_const.dart';
import 'package:teamleance_technecal_test/utils/key_word.dart';
import 'package:teamleance_technecal_test/utils/text_style.dart';
import 'package:teamleance_technecal_test/viewModel/register_vm.dart';
import 'package:teamleance_technecal_test/widget/custom_button.dart';
import 'package:teamleance_technecal_test/widget/loading_overlay.dart';
import 'package:teamleance_technecal_test/widget/my_text_form_field.dart';
import 'package:teamleance_technecal_test/widget/signup_here_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterVM>(builder: (registerVM) {
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
                    "signupTitle".tr,
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
                    key: registerVM.formKeyRegister,
                    child: Column(
                      children: [
                        MyTextFormField(
                            controller: registerVM.emailController,
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
                            isPassword: registerVM.isPassword,
                            showEyeIcon: true,
                            controller: registerVM.passwordController,
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
                              registerVM.isPassword = !registerVM.isPassword;
                              registerVM.update();
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        MyTextFormField(
                            isPassword: registerVM.isConfirmPassword,
                            showEyeIcon: true,
                            controller: registerVM.confirmPasswordController,
                            hintText: "confirmPasswordHint".tr,
                            labelText: "confirmPasswordHint".tr,
                            onSaved: (onSaved) {},
                            validator: (validator) {
                              if (validator == null || validator.isEmpty) {
                                return "confirmPasswordHint".tr;
                              }
                              return null;
                            },
                            callBackPasswordView: (callBackPasswordView) {
                              registerVM.isConfirmPassword = !registerVM.isConfirmPassword;
                              registerVM.update();
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        LoadingOverlay(
                          isLoading: registerVM.loadingRegister,
                          child: CustomButton(
                              callBack: (callBack) {
                                if (registerVM.formKeyRegister.currentState!.validate()) {
                                  if (registerVM.passwordController.text == registerVM.confirmPasswordController.text) {
                                    registerVM.loadingRegister = true;
                                    registerVM.update();

                                    registerVM.authHandler.handleSignUp(registerVM.emailController.text, registerVM.passwordController.text).then((User value) {
                                      debugPrint(" sign up userID  =  ${value.uid}");

                                      Pref.setValue(KeyWordFile.userID, value.uid);
                                      Get.offAllNamed(AppRoutes.homeScreen);

                                      registerVM.loadingRegister = false;
                                      registerVM.update();
                                    }).catchError((e) {
                                      AppUtils.showSnakeBar(context: context, msg: "signUpError".tr);
                                      registerVM.loadingRegister = false;
                                      registerVM.update();
                                      debugPrint(" sign up error =  $e");
                                    });
                                  } else {
                                    AppUtils.showSnakeBar(context: context, msg: "passError".tr, textColors: ColorConst.redColor);
                                  }
                                }
                              },
                              text: "signUp".tr),
                        ),
                        SignUpHereText(callback: (callback) {
                          Get.offAllNamed(AppRoutes.loginScreen);
                        })
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
