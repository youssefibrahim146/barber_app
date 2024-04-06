import 'package:barber/constants/app_imports.dart';

List<Widget> DeleteAccountBottomSheetWidgets({
  required Key formState,
  required RxBool isLoading,
  required RxBool isPasswordObscure,
  required VoidCallback deleteOnClick,
  required void Function(String?)? passwordOnSaved,
}) {
  return [
    Text(
      AppStrings.deleteAccountText,
      textAlign: TextAlign.center,
      style: AppFonts.fontHeavy20Petrol.copyWith(
        color: AppColors.white,
      ),
    ),
    GapWidget(25),
    Column(
      children: [
        Form(
          key: formState,
          child: Obx(
            () {
              return TextFormFieldWidget(
                color: AppColors.white,
                onSaved: passwordOnSaved,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.passwordEmptyValidate;
                  } else if (value.length < 8) {
                    return AppStrings.passwordLessThen8Validate;
                  } else if (value.length > 24) {
                    return AppStrings.passwordLargerThen24Validate;
                  }
                  return null;
                },
                obscure: isPasswordObscure.value,
                suffixIcon: InkWell(
                  onTap: () => isPasswordObscure.value = !isPasswordObscure.value,
                  child: Icon(
                    isPasswordObscure.value ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                  ),
                ),
                placeholder: AppStrings.confirmPasswordText,
                keyboardType: TextInputType.visiblePassword,
              );
            },
          ),
        ),
      ],
    ),
    GapWidget(25),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () => Get.back(),
          child: Container(
            alignment: Alignment.center,
            height: 40.sp,
            width: 100.sp,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15.sp),
            ),
            child: Text(
              AppStrings.cancelText,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                color: AppColors.petrol,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
        Obx(
          () => isLoading == false
              ? InkWell(
                  onTap: deleteOnClick,
                  child: Container(
                    alignment: Alignment.center,
                    height: 40.sp,
                    width: 100.sp,
                    decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    child: Text(
                      AppStrings.confirmText,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: 20.sp,
                  backgroundColor: AppColors.red,
                  child: Container(
                    padding: EdgeInsets.all(10.sp),
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                    ),
                  ),
                ),
        ),
      ],
    ),
    GapWidget(10),
  ];
}
