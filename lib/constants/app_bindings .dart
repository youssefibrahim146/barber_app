import 'package:barber/constants/app_imports.dart';
import 'package:barber/controllers/user_profile_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => BarberDetailsController(),
      fenix: true,
    );
    Get.lazyPut(
      () => PhoneSignupController(),
      fenix: true,
    );
    Get.lazyPut(
      () => UserProfileController(),
      fenix: true,
    );
    Get.lazyPut(
      () => GetStartedController(),
      fenix: true,
    );
    Get.lazyPut(
      () => SMSCodeController(),
      fenix: true,
    );
    Get.lazyPut(
      () => SignupController(),
      fenix: true,
    );
    Get.lazyPut(
      () => LoginController(),
      fenix: true,
    );
    Get.lazyPut(
      () => HomeController(),
      fenix: true,
    );
  }
}
