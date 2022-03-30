import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:teamleance_technecal_test/repo/auth_repo.dart';

class RegisterVM extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();
  bool loadingRegister=false;
  bool isPassword=true;
  bool isConfirmPassword=true;
  late AuthRepo authHandler;

  @override
  void onInit() {
    super.onInit();

    authHandler = AuthRepo();

  }
}