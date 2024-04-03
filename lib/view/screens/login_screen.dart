import 'package:barber/constants/app_imports.dart';

class LoginScreen extends GetWidget<LoginController> {
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
                child: Text("Login", style: AppFonts.fontHeavy40Petrol),
              ),
              const GapWidget(28),
              Hero(
                tag: "auth",
                child: Image.asset(
                  "assets/images/login-logo.png",
                  width: 311.sp,
                  height: 228.sp,
                ),
              ),
              const GapWidget(50),
              Container(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 33.h),
                decoration: BoxDecoration(
                  color: AppColors.petrol,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.sp),
                    topRight: Radius.circular(30.sp),
                  ),
                ),
                child: Form(
                  child: Column(
                    children: [
                      const InputFieldWidget(
                        text: "Email",
                        isObscure: false,
                      ),
                      const GapWidget(10),
                      const InputFieldWidget(
                        text: "Password",
                        isObscure: true,
                      ),
                      const GapWidget(21),
                      SubmitButton(
                        text: "Login",
                        onTap: () {
                          Get.offNamed(AppStrings.homeRoute);
                        },
                      ),
                      const GapWidget(19),
                      OnTapTextWidget(
                        onTap: () {},
                        text: "Login with Phone Number",
                      ),
                      const GapWidget(20),
                      SwitchAuthText(
                          onTap: () {
                            Get.offNamed(AppStrings.signupScreenRoute);
                          },
                          text1: "Not a User yet?",
                          text2: "Signup"),
                      const GapWidget(22),
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
