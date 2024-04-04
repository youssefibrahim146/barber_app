import 'package:barber/constants/app_imports.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onTap;
  final RxBool isLoading;
  final String text;

  const SubmitButton(
    this.text, {
    super.key,
    required this.onTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading.value ? () {} : onTap,
      child: Card(
        elevation: 10.sp,
        color: AppColors.petrol,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.sp),
          side: BorderSide(
            color: AppColors.white,
            width: 4.sp,
          ),
        ),
        child: Obx(
          () {
            return isLoading.value
                ? SizedBox(
                    height: 60.h,
                    width: 60.w,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.white,
                      ),
                    ),
                  )
                : SizedBox(
                    height: 60.h,
                    width: 200.w,
                    child: Center(
                      child: Text(
                        text,
                        style: AppFonts.fontHeavy25White,
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
