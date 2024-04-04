import 'package:barber/constants/app_imports.dart';

class PhoneSignupController extends GetxController {
  GlobalKey<FormState> phoneAuthFormKey = GlobalKey<FormState>();
  final phoneAuthController = TextEditingController();
  final phoneAuthFocusNode = FocusNode();

  nextButtonPressed() {
    if (phoneAuthFormKey.currentState!.validate()) {
      Get.toNamed(AppStrings.sMSCodeRoute);
    }
  }
}
