import 'dart:io';

import 'package:barber/constants/app_imports.dart';

EditProfileWidgets({
  required imageFile,
  required image,
  required Key formState,
  required RxString name,
  required String email,
  required RxString phone,
  required RxBool isLoading,
  required VoidCallback cancelOnClick,
  required VoidCallback confirmOnClick,
}) {
  return [
    GapWidget(10),
    InkWell(
      onTap: () async {
        final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          imageFile = File(pickedFile.path);
          image.value = imageFile!.path;
        }
      },
      child: CircleAvatar(
        radius: 40.sp,
        backgroundColor: AppColors.petrol,
        child: Stack(
          children: [
            Obx(
              () {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(
                    250.sp,
                  ),
                  child: imageFile != null
                      ? Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: Image.file(
                            imageFile!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: CachedNetworkImageWidget(
                            imageUrl: image!.value,
                            placeholderColor: AppColors.white,
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
                backgroundColor: AppColors.white,
                child: Icon(
                  Icons.camera_alt_rounded,
                  color: AppColors.petrol,
                  size: 15.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    GapWidget(20),
    Form(
      key: formState,
      child: Column(
        children: [
          TextFormFieldWidget(
            initVal: name.value,
            onSaved: (String? newValue) {
              name.value = newValue!;
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
            prefixIcon: Icon(Icons.person_rounded),
            placeholder: AppStrings.userNameText,
            keyboardType: TextInputType.text,
          ),
          GapWidget(15),
          TextFormFieldWidget(
            color: AppColors.transparentPetrol,
            onClick: () => AppDefaults.defaultToast(AppStrings.emailCanNotBeEditedToast),
            initVal: email,
            readOnly: true,
            style: AppFonts.fontHeavy18grey.copyWith(color: AppColors.transparentPetrol),
            prefixIcon: Icon(Icons.email_rounded),
          ),
          GapWidget(15),
          TextFormFieldWidget(
            initVal: phone.value,
            onSaved: (String? newValue) {
              phone.value = newValue!;
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return AppStrings.phoneNumberEmptyValidate;
              } else if (value.length <= 15) {
                return AppStrings.badlyFormattedPhoneNumberValidate;
              } else if (value.length >= 17) {
                return AppStrings.badlyFormattedPhoneNumberValidate;
              }
              return null;
            },
            prefixIcon: Icon(Icons.phone_rounded),
            labelName: AppStrings.phoneNumberText,
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    ),
    GapWidget(25),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: cancelOnClick,
          child: Container(
            alignment: Alignment.center,
            height: 40.sp,
            width: 100.sp,
            decoration: BoxDecoration(
              color: AppColors.petrol,
              borderRadius: BorderRadius.circular(15.sp),
            ),
            child: Text(
              AppStrings.cancelText,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
        Obx(
          () => isLoading == false
              ? InkWell(
                  onTap: confirmOnClick,
                  child: Container(
                    alignment: Alignment.center,
                    height: 40.sp,
                    width: 100.sp,
                    decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    child: Text(
                      AppStrings.confirmText,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: 20.sp,
                  backgroundColor: AppColors.red,
                  child: Container(
                    padding: EdgeInsets.all(10.sp),
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                    ),
                  ),
                ),
        ),
      ],
    ),
    GapWidget(10),
  ];
}
