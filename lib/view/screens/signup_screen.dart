import 'package:barber/constants/app_imports.dart';

class SignupScreen extends GetWidget<SignupController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30.sp),
        child: SingleChildScrollView(
          physics: MediaQuery.of(context).viewInsets.bottom > 0 ? const ClampingScrollPhysics() : const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: AppStrings.textTag,
                child: Card(
                  elevation: 0.sp,
                  margin: EdgeInsets.all(0.sp),
                  color: AppColors.transparent,
                  child: SizedBox(
                    width: 150.sp,
                    child: Center(
                      child: Text(
                        AppStrings.signupText,
                        style: AppFonts.fontHeavy40Petrol,
                      ),
                    ),
                  ),
                ),
              ),
              const GapWidget(23),
              Hero(
                tag: AppStrings.imageTag,
                child: Card(
                  elevation: 0.sp,
                  margin: EdgeInsets.all(0.sp),
                  color: AppColors.transparent,
                  child: Image.asset(
                    AppStrings.signupAsset,
                    width: 295.sp,
                    height: 206.sp,
                  ),
                ),
              ),
              Hero(
                tag: AppStrings.containerTag,
                child: Card(
                  elevation: 0.sp,
                  margin: EdgeInsets.all(0.sp),
                  color: AppColors.transparent,
                  child: Container(
                    height: 500.h,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.petrol,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.sp),
                        topRight: Radius.circular(30.sp),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const InputFieldWidget(
                            text: AppStrings.firstNameText,
                            isObscure: false,
                          ),
                          const InputFieldWidget(
                            text: AppStrings.lastNameText,
                            isObscure: false,
                          ),
                          InputFieldWidget(
                            text: AppStrings.emailText,
                            isObscure: false,
                          ),
                          const InputFieldWidget(
                            text: AppStrings.passwordText,
                            isObscure: true,
                          ),
                          SubmitButton(
                            onTap: controller.signupButtonOnClick,
                            text: AppStrings.signupText,
                          ),
                          const GapWidget(20),
                          OnTapTextWidget(
                            onTap: controller.signupWithPhoneNumberTextOnClick,
                            text: AppStrings.signupWithPhoneNumberText,
                          ),
                          const GapWidget(10),
                          SwitchAuthText(
                            onTap: controller.loginTextOnClick,
                            text1: AppStrings.alreadyUserText,
                            text2: AppStrings.loginText,
                          ),
                        ],
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
