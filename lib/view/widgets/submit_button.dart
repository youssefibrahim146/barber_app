import 'package:barber/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/fonts.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const SubmitButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors().petrolColor,
            border: Border.all(color: AppColors().whiteColor, width: 4.sp),
            borderRadius: BorderRadius.circular(35.sp)),
        padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 15.h),
        child: Text(
          text,
          style: fontHeavy25White,
        ),
      ),
    );
  }
}
