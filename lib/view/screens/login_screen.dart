import 'package:barber/constants/app_colors.dart';
import 'package:barber/constants/fonts.dart';
import 'package:barber/constants/strings.dart';
import 'package:barber/helpers/app_space.dart';
import 'package:barber/view/widgets/on_tap_text.dart';
import 'package:barber/view/widgets/switch_auth_screen_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/input_field.dart';
import '../widgets/submit_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 82.h),
                child: Text("Login", style: fontHeavy40Petrol),
              ),
              const SpaceTap(size: 28),
              Hero(
                tag: "auth",
                child: Image.asset(
                  "assets/images/login-logo.png",
                  width: 311.sp,
                  height: 228.sp,
                ),
              ),
              const SpaceTap(size: 50),
              Container(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 33.h),
                decoration: BoxDecoration(
                  color: AppColors().petrolColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.sp),
                    topRight: Radius.circular(30.sp),
                  ),
                ),
                child: Form(
                  child: Column(
                    children: [
                      const InputField(
                        text: "Email",
                        isObscure: false,
                      ),
                      const SpaceTap(size: 10),
                      const InputField(
                        text: "Password",
                        isObscure: true,
                      ),
                      const SpaceTap(size: 21),
                      SubmitButton(
                        text: "Login",
                        onTap: () {},
                      ),
                      const SpaceTap(size: 19),
                      OnTapText(
                        onTap: () {},
                        text: "Login with Phone Number",
                      ),
                      const SpaceTap(size: 20),
                      SwitchAuthText(
                          onTap: () {
                            Get.offNamed(signupScreen);
                          },
                          text1: "Not a User yet?",
                          text2: "Signup"),
                      const SpaceTap(size: 22),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
