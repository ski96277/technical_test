import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AppUtils {
  static bool isLogin() {

    User? currentUser = FirebaseAuth.instance.currentUser;


    if (currentUser != null) {
      return true;
    } else {
      return false;
    }
  }


  static getW(context){
    return MediaQuery.of(context).size.width;
  }
  static getH(context){
    return MediaQuery.of(context).size.height;
  }

  /// email validation
  static bool isEmailNotValidate(String email) {
    return !RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  ///show snack bar
  static void showSnakeBar({
    required BuildContext context,
    String title = "",
    required String msg,
    backgroundColors = Colors.white,
    Color textColors = Colors.black,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: TextStyle(color: textColors),
      ),
      backgroundColor: backgroundColors,
    ));
  }

}
