import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:teamleance_technecal_test/utils/app_utils.dart';

class SignUpHereText extends StatelessWidget {
  Function(String? value) callback;
  String firstText;
  String secondText;

  SignUpHereText({
    required this.callback,
    this.firstText = "Already Have an account? ",
    this.secondText = "Login",
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback("pressed"),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: firstText,
                ),
                TextSpan(
                  text: secondText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,


                    color: Theme.of(context).colorScheme.primary,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () => callback("pressed"),
                ),
              ],
            ),
          )),
    );
  }
}
