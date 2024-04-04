import 'package:barber/constants/app_imports.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  String? emailAddress, password;
  RxBool isObscure = RxBool(true);
  RxBool isLoading = RxBool(false);

  loginValidator() async {
    FocusManager.instance.primaryFocus?.unfocus();
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();
      isLoading.value = true;
      var connection = await InternetConnectionChecker().hasConnection;
      if (connection == true) {
        try {
          UserCredential userCredential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress!,
            password: password!,
          );
          return userCredential;
        } on FirebaseAuthException catch (e) {
          isLoading.value = false;
          AppDefaults.defaultToast(
              AppFormats.myFormatter(e.toString(), AppStrings.spaceSign));
        } catch (e) {
          isLoading.value = false;
          AppDefaults.defaultToast(
              AppFormats.myFormatter(e.toString(), AppStrings.spaceSign));
        }
      } else {
        isLoading.value = false;
        AppDefaults.defaultToast(AppStrings.connectionErrorToast);
      }
    }
  }

  void loginButtonOnClick() async {
    UserCredential res = await loginValidator();
    if (res != null && FirebaseAuth.instance.currentUser!.emailVerified) {
      Get.offAllNamed(AppStrings.homeRoute);
    } else {
      isLoading.value = false;
      AppDefaults.defaultToast(AppStrings.verifyEmailFirstToast);
    }
  }

  void forgotPasswordClick() {
    Get.toNamed(AppStrings.forgotPasswordRouteRoute);
  }

  void obscureOnClick() {
    isObscure.value = !isObscure.value;
  }

  void loginWithPhoneNumberTextOnClick() {
    Get.toNamed(AppStrings.phoneSignupRoute);
  }

  void signupTextOnClick() {
    Get.offNamed(AppStrings.signupRoute);
  }
}
