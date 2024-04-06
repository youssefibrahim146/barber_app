import 'package:barber/constants/app_imports.dart';

class PhoneSignupController extends GetxController {
  GlobalKey<FormState> phoneAuthFormKey = GlobalKey<FormState>();
  final phoneAuthController = TextEditingController();
  final phoneAuthFocusNode = FocusNode();
  final SMSCodeController smsCodeController = SMSCodeController();

  nextButtonPressed({required String phoneNumber}) {
    if (phoneAuthFormKey.currentState!.validate()) {
      smsCodeController.verifyPhoneNumber(
        smsCodeController.formatPhoneNumber(phoneNumber),
      );
      Get.toNamed(
        AppStrings.sMSCodeRoute,
        arguments: phoneNumber,
      );
    }
  }
}
