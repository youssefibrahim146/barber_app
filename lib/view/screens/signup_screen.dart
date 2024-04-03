import 'package:barber/constants/app_imports.dart';

class SignupScreen extends GetWidget<SignupController> {
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
              Text("SignUP", style: AppFonts.fontHeavy40Petrol),
              const GapWidget(23),
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
                  color: AppColors.petrol,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.sp),
                    topRight: Radius.circular(30.sp),
                  ),
                ),
                child: Column(
                  children: [
                    const InputFieldWidget(text: "First Name", isObscure: false),
                    const InputFieldWidget(text: "Last Name", isObscure: false),
                    const InputFieldWidget(text: "Email", isObscure: false),
                    const InputFieldWidget(text: "Password", isObscure: true),
                    SubmitButton(onTap: () {}, text: "SignUp"),
                    const GapWidget(22),
                    OnTapTextWidget(onTap: () {}, text: "SignUP with Phone Number"),
                    const GapWidget(20),
                    SwitchAuthText(
                        onTap: () {
                          Get.offNamed(AppStrings.loginScreenRoute);
                        },
                        text1: "Already a User?",
                        text2: "Login"),
                    const GapWidget(22),
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
