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
    return TextButton(
      onPressed: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.petrol,
          border: Border.all(
            color: AppColors.white,
            width: 4.sp,
          ),
          borderRadius: BorderRadius.circular(35.sp),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 80.w,
          vertical: 15.h,
        ),
        child: Text(
          text,
          style: AppFonts.fontHeavy25White,
        ),
      ),
    );
  }
}
