import 'package:barber/constants/app_imports.dart';

class AppDefaults {
  static Future<bool?> defaultToast(text) {
    return Fluttertoast.showToast(
      msg: text,
      backgroundColor: AppColors.petrol,
      textColor: AppColors.white,
      fontSize: 14.sp,
    );
  }
}
