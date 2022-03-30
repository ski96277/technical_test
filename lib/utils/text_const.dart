import 'package:get/get_navigation/src/root/internacionalization.dart';

class TextConst extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'emailHint': 'Write Email',
          'passwordHint': 'Write password',
          'confirmPasswordHint': 'Confirm password',
          'signUp': 'Signup',
          'login': 'Login',
          'signupTitle': 'Register account',
          'loginTitle': 'Login account',
          'signupSubTitle': 'Welcome to our app',
          'noAccount': "Don't have an account? ",
          'forgotPassword': "Forgot password? ",
          'reset': "Reset",
          'validEmailError': "Enter a valid email",
          'passError': "Password & Confirm password doesn't mass",
          'signUpError': "Signup failed try again",
          'homeTitle': "Home",
          'bookedPlace': "Booked Place",
          'seeAll': "See All",
          'availableBook': "Available booking place",
          'emptyDialog': "No place Booked yet.\nPlease book from below item",
          'empty': "No place Booked yet.",
          'bookNow': "Book now",
          'removeBooking': "Cancel",
          'program': "Program",
        },
        'fr_FR': {}
      };
}
