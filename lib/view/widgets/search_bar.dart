import 'package:barber/constants/app_colors.dart';
import 'package:barber/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style:
          fontLight14grey.copyWith(fontSize: 17, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        hintText: "Search Here ...",
        prefixIcon: Container(
          margin: EdgeInsets.only(right: 12.sp),
          padding: EdgeInsets.all(14.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.sp),
            color: AppColors().petrolColor,
          ),
          child: Icon(
            Icons.search,
            color: Colors.black,
            size: 35.sp,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.sp),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.sp),
          borderSide: BorderSide(color: AppColors().lightGreyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.sp),
          borderSide: BorderSide(color: AppColors().lightGreyColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.sp),
          borderSide: BorderSide(color: AppColors().lightGreyColor),
        ),
      ),
    );
  }
}
