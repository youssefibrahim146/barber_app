import '../../constants/app_imports.dart';

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
                  color: AppColors.petrolColor,
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
                        onTap: () {
                          Get.offNamed(AppStrings.homeScreenRoute);
                        },
                      ),
                      const SpaceTap(size: 19),
                      OnTapText(
                        onTap: () {},
                        text: "Login with Phone Number",
                      ),
                      const SpaceTap(size: 20),
                      SwitchAuthText(
                          onTap: () {
                            Get.offNamed(AppStrings.signupScreenRoute);
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
