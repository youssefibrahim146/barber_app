import 'package:barber/constants/app_imports.dart';

class GetStartedController extends GetxController {
  void getStartedOnClick() {
    Get.offNamed(AppStrings.loginRoute);
  }
}
