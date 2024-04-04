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
                      physics: const ClampingScrollPhysics(),
                      child: Form(
                        key: controller.formState,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const GapWidget(20),
                            InkWell(
                              onTap: controller.pickImage,
                              child: CircleAvatar(
                                backgroundColor: AppColors.white,
                                radius: 40.sp,
                                child: Stack(
                                  children: [
                                    Obx(
                                      () {
                                        return ClipRRect(
                                          borderRadius: BorderRadius.circular(250.sp),
                                          child: Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: AppColors.white,
                                            ),
                                            child: controller.image.value != null
                                                ? Container(
                                                    height: double.infinity,
                                                    width: double.infinity,
                                                    child: Image.file(
                                                      controller.image.value!,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )
                                                : Icon(
                                                    Icons.person_rounded,
                                                    color: AppColors.petrol,
                                                    size: 40.sp,
                                                  ),
                                          ),
                                        );
                                      },
                                    ),
                                    Container(
                                      alignment: Alignment.bottomRight,
                                      decoration: BoxDecoration(),
                                      child: CircleAvatar(
                                        radius: 10.sp,
                                        backgroundColor: AppColors.petrol,
                                        child: Icon(
                                          Icons.camera_alt_rounded,
                                          color: AppColors.white,
                                          size: 15.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GapWidget(10),
                            InputFieldWidget(
                              onSaved: (value) {
                                controller.userName = value!;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppStrings.nameEmptyValidate;
                                } else if (value.length < 4) {
                                  return AppStrings.nameLessThen4Validate;
                                } else if (value.length > 24) {
                                  return AppStrings.nameLargerThen24Validate;
                                }
                                return null;
                              },
                              placeholder: AppStrings.userNameText,
                              keyboardType: TextInputType.text,
                            ),
                            InputFieldWidget(
                              onSaved: (value) {
                                controller.emailAddress = value!;
                              },
                              validator: (value) {
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
                            Obx(
                              () {
                                return InputFieldWidget(
                                  onSaved: (value) {
                                    controller.password = value!;
                                  },
                                  validator: (value) {
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
                                  textAlign: TextAlign.start,
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
                            GapWidget(10),
                            SubmitButton(
                              AppStrings.signupText,
                              isLoading: controller.isLoading,
                              onTap: controller.signupButtonOnClick,
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
