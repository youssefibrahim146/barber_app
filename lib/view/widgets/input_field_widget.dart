import 'package:barber/constants/app_imports.dart';

class InputFieldWidget extends StatelessWidget {
  final String text;
  final bool isObscure;

  const InputFieldWidget({
    super.key,
    required this.text,
    required this.isObscure,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: AppFonts.fontHeavy20Petrol,
          fillColor: AppColors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.sp),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.sp),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.sp),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.sp),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
        style: AppFonts.fontHeavy20Petrol,
      ),
    );
  }
}
