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
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: Form(
                        key: controller.formState,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const GapWidget(20),
                            TextFormFieldWidget(
                              color: AppColors.petrol,
                              padding: 0.sp,
                              filled: true,
                              onSaved: (String? value) {
                                controller.emailAddress = value!;
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return AppStrings.emailEmptyValidate;
                                } else if (!value.contains(AppStrings.atSign)) {
                                  return AppStrings.emailMessingAtSignValidate;
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              placeholder: AppStrings.emailText,
                            ),
                            GapWidget(10),
                            Obx(
                              () {
                                return TextFormFieldWidget(
                                  color: AppColors.petrol,
                                  padding: 0.sp,
                                  filled: true,
                                  onSaved: (String? value) {
                                    controller.password = value!;
                                  },
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return AppStrings.passwordEmptyValidate;
                                    } else if (value.length < 8) {
                                      return AppStrings.passwordLessThen8Validate;
                                    } else if (value.length > 24) {
                                      return AppStrings.passwordLargerThen24Validate;
                                    }
                                    return null;
                                  },
                                  placeholder: AppStrings.passwordText,
                                  obscure: controller.isObscure.value,
                                  suffixIcon: InkWell(
                                    onTap: controller.passwordObscureOnClick,
                                    child: Icon(
                                      controller.isObscure.value ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                                      color: AppColors.petrol,
                                    ),
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                );
                              },
                            ),
                            GapWidget(20),
                            SubmitButton(
                              AppStrings.loginText,
                              isLoading: controller.isLoading,
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
                            const GapWidget(20),
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
