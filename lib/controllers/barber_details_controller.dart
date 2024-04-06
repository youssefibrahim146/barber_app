import 'package:barber/constants/app_imports.dart';
import 'package:url_launcher/url_launcher.dart';

class BarberDetailsController extends GetxController {
  BarberModel barber = Get.arguments;

  void phoneButtonOnClick() {
    launch(AppStrings.telText + barber.phone);
  }

  void locationButtonOnClick() {
    launch(barber.location);
  }
}
