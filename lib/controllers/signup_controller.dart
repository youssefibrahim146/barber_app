import 'package:barber/constants/app_imports.dart';

class SignupController extends GetxController {
  void signupButtonOnClick() {}

  void signupWithPhoneNumberTextOnClick() {}

  void loginTextOnClick() {
    Get.offNamed(AppStrings.loginScreenRoute);
  }
}
