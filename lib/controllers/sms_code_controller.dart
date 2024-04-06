import 'package:barber/constants/app_imports.dart';

class SMSCodeController extends GetxController {
  late String verificationId;

  formatPhoneNumber(String phoneNumber) {
    if (phoneNumber[0] == "0" && phoneNumber[1] == "1") {
      phoneNumber = phoneNumber.substring(1);
      return phoneNumber;
    }
  }

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+20" + phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          AppDefaults.defaultToast(e.message!);
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        this.verificationId = verificationId;

        /// Update the UI - wait for the user to enter the SMS code
        //String smsCode = otp;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> signInWithPhoneNumber(
      String smsCode, String verificationId) async {
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
    } catch (e) {
      AppDefaults.defaultToast(e.toString());
    }
  }
}
