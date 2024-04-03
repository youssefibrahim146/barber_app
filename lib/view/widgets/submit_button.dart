import 'package:barber/constants/app_imports.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const SubmitButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
        child: SizedBox(
          height: 60.h,
          width: 200.w,
          child: Center(
            child: Text(
              text,
              style: AppFonts.fontHeavy25White,
            ),
          ),
        ),
      ),
    );
  }
}
