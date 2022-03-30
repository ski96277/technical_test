import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teamleance_technecal_test/routes/app_routes.dart';
import 'package:teamleance_technecal_test/utils/app_utils.dart';
import 'package:teamleance_technecal_test/utils/color_const.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (AppUtils.isLogin()) {
        Get.offAllNamed(AppRoutes.homeScreen);
      } else {
        Get.offAllNamed(AppRoutes.registerScreen);
      }
    });

    return Scaffold(
      backgroundColor: ColorConst.lightGeryColor,
      body: Stack(
        children: [
          Image.asset(
            "assets/bg/img.png",
            fit: BoxFit.fill,
            height: AppUtils.getH(context),
            width: AppUtils.getW(context),
          ),
          Container(color:const Color.fromARGB(100, 22, 44, 33),)
        ],
      ),
    );
  }
}
