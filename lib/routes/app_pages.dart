import 'package:get/get.dart';
import 'package:teamleance_technecal_test/screen/home_screen.dart';
import 'package:teamleance_technecal_test/screen/login_screen.dart';
import 'package:teamleance_technecal_test/screen/place_details_screen.dart';
import 'package:teamleance_technecal_test/screen/place_list_screen.dart';
import 'package:teamleance_technecal_test/screen/signup_screen.dart';
import 'package:teamleance_technecal_test/screen/splash_screen.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.registerScreen,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.placeDetailsScreen,
      page: () => const PlaceDetailsScreen(),
    ),
    GetPage(
      name: AppRoutes.placeListScreen,
      page: () => const PlaceListScreen(),
    ),
  ];
}
