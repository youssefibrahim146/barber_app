import 'package:barber/constants/app_colors.dart';
import 'package:barber/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputField extends StatelessWidget {
  final String text;
  final bool isObscure;

  const InputField({super.key, required this.text, required this.isObscure});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: fontHeavy20Petrol,
        fillColor: AppColors().whiteColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.sp),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.sp),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.sp),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.sp),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),
      style: fontHeavy20Petrol,
    );
  }
}
