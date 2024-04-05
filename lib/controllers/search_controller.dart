import 'package:barber/constants/app_imports.dart';

class MySearchController extends GetxController {
  List<BarberModel> barbersBasedOnSearch = Get.arguments[0];
  String search = Get.arguments[1];

  void barberItemOnClick(BarberModel barber) {
    Get.toNamed(
      AppStrings.barberDetailsRoute,
      arguments: barber,
    );
  }
}
