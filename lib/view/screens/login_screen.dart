import 'package:barber/constants/app_imports.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: MediaQuery.of(context).viewInsets.bottom > 0 ? const ClampingScrollPhysics() : const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 82.h),
                child: Hero(
                  tag: AppStrings.textTag,
                  child: Card(
                    elevation: 0.sp,
                    margin: EdgeInsets.all(0.sp),
                    color: AppColors.transparent,
                    child: SizedBox(
                      width: 150.sp,
                      child: Center(
                        child: Text(
                          AppStrings.loginText,
                          style: AppFonts.fontHeavy40Petrol,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const GapWidget(28),
              Hero(
                tag: AppStrings.imageTag,
                child: Card(
                  elevation: 0.sp,
                  margin: EdgeInsets.all(0.sp),
                  color: AppColors.transparent,
                  child: Image.asset(
                    AppStrings.loginAsset,
                    width: 311.sp,
                    height: 228.sp,
                  ),
                ),
              ),
              const GapWidget(50),
              Hero(
                tag: AppStrings.containerTag,
                child: Card(
                  elevation: 0.sp,
                  margin: EdgeInsets.all(0.sp),
                  color: AppColors.transparent,
                  child: Container(
                    height: 400.h,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.petrol,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30.sp),
                      ),
                    ),
                    child: Form(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const InputFieldWidget(
                              text: AppStrings.emailText,
                              isObscure: false,
                            ),
                            const InputFieldWidget(
                              text: AppStrings.passwordText,
                              isObscure: true,
                            ),
                            SubmitButton(
                              text: AppStrings.loginText,
                              onTap: controller.loginButtonOnClick,
                            ),
                            const GapWidget(20),
                            OnTapTextWidget(
                              onTap: controller.loginWithPhoneNumberTextOnClick,
                              text: AppStrings.loginWithPhoneNumberText,
                            ),
                            const GapWidget(10),
                            SwitchAuthText(
                              onTap: controller.signupTextOnClick,
                              text1: AppStrings.notUserText,
                              text2: AppStrings.signupText,
                            ),
                            const GapWidget(22),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
