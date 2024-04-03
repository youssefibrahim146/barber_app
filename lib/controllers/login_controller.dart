import 'package:barber/constants/app_imports.dart';

class LoginController extends GetxController {
  void loginButtonOnClick() {
    Get.offNamed(AppStrings.homeRoute);
  }

  void loginWithPhoneNumberTextOnClick() {}

  void signupTextOnClick() {
    Get.offNamed(AppStrings.signupScreenRoute);
  }
}
