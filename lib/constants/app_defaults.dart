import 'package:barber/constants/app_imports.dart';

class AppDefaults {
  static defaultDialogWithConfirmAndCancel({
    required String title,
    required Widget subTitle,
    required RxBool isLoading,
    required String secondButtonText,
    required VoidCallback secondButtonClick,
  }) {
    Get.defaultDialog(
      backgroundColor: AppColors.petrol,
      barrierDismissible: false,
      title: title,
      titleStyle: TextStyle(
        color: AppColors.white,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      titlePadding: EdgeInsets.only(
        top: 25.sp,
      ),
      radius: 15.sp,
      content: Column(
        children: [
          GapWidget(10),
          subTitle,
          GapWidget(25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DialogButtonWidget(
                text: AppStrings.cancelText,
                color: AppColors.white,
                onTap: () => Get.back(),
              ),
              Obx(
                () => isLoading == false
                    ? DialogButtonWidget(
                        text: secondButtonText,
                        color: AppColors.red,
                        onTap: secondButtonClick,
                        white: AppColors.white,
                      )
                    : CircleAvatar(
                        radius: 20.sp,
                        backgroundColor: AppColors.red,
                        child: Container(
                          padding: EdgeInsets.all(10.sp),
                          child: CircularProgressIndicator(color: AppColors.white),
                        ),
                      ),
              ),
            ],
          ),
          GapWidget(10),
        ],
      ),
    );
  }

  static defaultDialogWithOut(title, subTitle, {bool? dismissible}) {
    Get.defaultDialog(
      backgroundColor: AppColors.petrol,
      barrierDismissible: dismissible ?? true,
      title: title,
      titleStyle: TextStyle(
        color: AppColors.white,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      titlePadding: EdgeInsets.only(top: 25.sp),
      onWillPop: () async => dismissible ?? true,
      radius: 15.sp,
      content: Column(
        children: [
          GapWidget(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static defaultBottomSheet(List<Widget> widgets, {double? height, bool? isDismissible}) {
    Get.bottomSheet(
      backgroundColor: AppColors.petrol,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.sp)),
      ),
      isDismissible: isDismissible ?? false,
      enterBottomSheetDuration: Duration(
        milliseconds: 500,
      ),
      exitBottomSheetDuration: Duration(
        milliseconds: 500,
      ),
      SizedBox(
        height: height ?? 550.h,
        child: SafeArea(
          child: WillPopScope(
            onWillPop: () async => isDismissible ?? false,
            child: Center(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(children: widgets),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static OutlineInputBorder defaultOutlineInputBorder(double radius, {Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius.sp),
      borderSide: BorderSide(color: color ?? AppColors.petrol),
    );
  }

  static Future<bool?> defaultToast(String text) {
    return Fluttertoast.showToast(
      msg: text,
      backgroundColor: AppColors.petrol,
      textColor: AppColors.white,
      fontSize: 14.sp,
    );
  }
}
