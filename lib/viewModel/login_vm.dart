import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:teamleance_technecal_test/repo/auth_repo.dart';

class LoginVM extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  bool loadingLogin=false;
  bool isPassword=true;
  bool isConfirmPassword=true;

  late AuthRepo authHandler;

  @override
  void onInit() {
    super.onInit();

    authHandler = AuthRepo();

  }
}
