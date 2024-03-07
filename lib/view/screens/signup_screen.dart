import 'package:barber/constants/fonts.dart';
import 'package:barber/constants/strings.dart';
import 'package:barber/helpers/app_space.dart';
import 'package:barber/view/widgets/input_field.dart';
import 'package:barber/view/widgets/on_tap_text.dart';
import 'package:barber/view/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../widgets/switch_auth_screen_text.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("SignUP", style: fontHeavy40Petrol),
              const SpaceTap(size: 23),
              Hero(
                tag: "auth",
                child: Image.asset(
                  "assets/images/signupImage.png",
                  width: 295.sp,
                  height: 206.sp,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 33.h),
                decoration: BoxDecoration(
                  color: AppColors().petrolColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.sp),
                    topRight: Radius.circular(30.sp),
                  ),
                ),
                child: Column(
                  children: [
                    const InputField(text: "First Name", isObscure: false),
                    const InputField(text: "Last Name", isObscure: false),
                    const InputField(text: "Email", isObscure: false),
                    const InputField(text: "Password", isObscure: true),
                    SubmitButton(onTap: () {}, text: "SignUp"),
                    const SpaceTap(size: 22),
                    OnTapText(onTap: () {}, text: "SignUP with Phone Number"),
                    const SpaceTap(size: 20),
                    SwitchAuthText(
                        onTap: () {
                          Get.offNamed(loginScreen);
                        },
                        text1: "Already a User?",
                        text2: "Login"),
                    const SpaceTap(size: 22),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
