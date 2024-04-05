import 'dart:io';

import 'package:barber/constants/app_imports.dart';

class UserProfileController extends GetxController {
  static Query usersCollectionWhereEmailEqualsCurrentUserEmail = usersCollection.where(AppStrings.emailField, isEqualTo: currentUserEmail);
  static String formattedEmail = AppFormats.myFormatter(currentUserEmail, AppStrings.underscoreSign);
  static CollectionReference usersCollection = firestore.collection(AppStrings.usersCollection);
  GlobalKey<FormState> changePasswordFormState = GlobalKey<FormState>();
  GlobalKey<FormState> deleteAccountFormState = GlobalKey<FormState>();
  GlobalKey<FormState> editProfileFormState = GlobalKey<FormState>();
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseStorage firestorage = FirebaseStorage.instance;
  static String currentUserEmail = fireauth.currentUser!.email!;
  static FirebaseAuth fireauth = FirebaseAuth.instance;
  RxBool isDeleteAccountPasswordObscure = RxBool(true);
  static HomeController homeControllerStatic = Get.find();
  HomeController homeController = Get.find();
  RxBool isOldPasswordObscure = RxBool(true);
  RxBool isNewPasswordObscure = RxBool(true);
  RxString image = homeControllerStatic.currentUser.value.image;
  RxString phone = homeControllerStatic.currentUser.value.phone;
  RxString name = homeControllerStatic.currentUser.value.name;
  RxBool isObscure = RxBool(true);
  RxBool isLoading = false.obs;
  String? newPassword;
  String? oldPassword;
  String? password;

  /// To edit the user profile
  void editProfileOnClick() {
    File? imageFile;
    AppDefaults.defaultBottomSheet(
      EditProfileWidgets(
        imageFile: imageFile,
        image: homeController.currentUser.value.image,
        formState: editProfileFormState,
        name: name,
        email: currentUserEmail,
        phone: phone,
        cancelOnClick: () {
          FocusManager.instance.primaryFocus?.unfocus();
          Get.back();
          isLoading.value = false;
          homeController.fetchUserData();
        },
        confirmOnClick: () async {
          FocusManager.instance.primaryFocus?.unfocus();
          var formData = editProfileFormState.currentState;
          if (formData!.validate()) {
            isLoading.value = true;
            formData.save();

            /// To update the current user profile image.
            Reference storageReference = firestorage.ref().child(AppStrings.profileImagesBase + formattedEmail + AppStrings.profileImageNameEndBase);
            try {
              /// Upload the image file from the user's phone system.
              await storageReference.putFile(
                File(image.value),
                SettableMetadata(contentType: AppStrings.imagesTypeBase),
              );

              /// Get the download URL of the uploaded image.
              String downloadURL = await storageReference.getDownloadURL();

              /// Update profileImage field with the download URL from users collection.
              await usersCollectionWhereEmailEqualsCurrentUserEmail.get().then(
                (querySnapshot) {
                  if (querySnapshot.docs.isNotEmpty) {
                    querySnapshot.docs[0].reference.update({AppStrings.profileImageField: downloadURL});
                  }
                },
              );
            } catch (e) {
              debugPrint(e.toString());
            }

            /// To update the current user name, phone number.
            try {
              /// Update user name field from users collection.
              DocumentReference postRef = usersCollection.doc(currentUserEmail);
              await postRef.update(
                {
                  AppStrings.nameField: name.value,
                  AppStrings.phoneField: phone.value,
                },
              );
            } catch (e) {
              AppDefaults.defaultToast(
                AppStrings.errorUpdatingToast + e.toString(),
              );
            }
            Get.back();
            homeController.fetchUserData();
            isLoading.value = false;
          }
        },
        isLoading: isLoading,
      ),
    );
  }

  /// To change current user password.
  void changePasswordButtonOnClick() {
    AppDefaults.defaultBottomSheet(
      height: 350.h,
      isDismissible: true,
      ChangePasswordBottomSheetWidgets(
        formState: changePasswordFormState,
        isLoading: isLoading,
        isOldPasswordObscure: isOldPasswordObscure,
        oldPasswordOnSaved: (value) {
          oldPassword = value;
        },
        isNewPasswordObscure: isNewPasswordObscure,
        newPasswordOnSaved: (value) {
          newPassword = value;
        },
        confirmOnClick: () async {
          isLoading.value = true;
          FocusManager.instance.primaryFocus?.unfocus();
          var formData = changePasswordFormState.currentState;
          if (formData!.validate()) {
            formData.save();
            isLoading.value = true;
            User? user = fireauth.currentUser;
            try {
              /// Authenticating to make sure that the user is logged in.
              if (user != null) {
                AuthCredential credential = EmailAuthProvider.credential(
                  email: currentUserEmail,
                  password: oldPassword!,
                );
                await user.reauthenticateWithCredential(credential);

                /// Change current user password.
                FirebaseAuth.instance.currentUser!.updatePassword(newPassword!);
                Get.back();
                AppDefaults.defaultToast(AppStrings.passwordChangedSuccessfullyToast);
              }
            } catch (e) {
              isLoading.value = false;
              AppDefaults.defaultToast(AppStrings.errorResettingPasswordToast + e.toString());
            }
            isLoading.value = false;
          } else {
            isLoading.value = false;
          }
        },
      ),
    );
  }

  /// To display current user reservations.
  void reservationsButtonOnClick() {
    AppDefaults.defaultBottomSheet(
      height: 400.h,
      isDismissible: true,
      ChangePasswordBottomSheetWidgets(
        formState: changePasswordFormState,
        isLoading: isLoading,
        isOldPasswordObscure: isOldPasswordObscure,
        oldPasswordOnSaved: (value) {
          oldPassword = value;
        },
        isNewPasswordObscure: isNewPasswordObscure,
        newPasswordOnSaved: (value) {
          newPassword = value;
        },
        confirmOnClick: () async {
          isLoading.value = true;
          FocusManager.instance.primaryFocus?.unfocus();
          var formData = changePasswordFormState.currentState;
          if (formData!.validate()) {
            formData.save();
            isLoading.value = true;
            User? user = fireauth.currentUser;
            try {
              /// Authenticating to make sure that the user is logged in.
              if (user != null) {
                AuthCredential credential = EmailAuthProvider.credential(
                  email: currentUserEmail,
                  password: oldPassword!,
                );
                await user.reauthenticateWithCredential(credential);

                /// Change current user password.
                FirebaseAuth.instance.currentUser!.updatePassword(newPassword!);
                Get.back();
                AppDefaults.defaultToast(AppStrings.passwordChangedSuccessfullyToast);
              }
            } catch (e) {
              isLoading.value = false;
              AppDefaults.defaultToast(AppStrings.errorResettingPasswordToast + e.toString());
            }
            isLoading.value = false;
          } else {
            isLoading.value = false;
          }
        },
      ),
    );
  }

  /// To delete all the current user data and delete his account from fireauth.
  void deleteAccountOnClick() {
    AppDefaults.defaultBottomSheet(
      height: 300.h,
      isDismissible: true,
      DeleteAccountBottomSheetWidgets(
        formState: deleteAccountFormState,
        isLoading: isLoading,
        isPasswordObscure: isDeleteAccountPasswordObscure,
        deleteOnClick: () async {
          if (deleteAccountFormState.currentState!.validate()) {
            deleteAccountFormState.currentState!.save();
            isLoading.value = true;
            User? user = fireauth.currentUser;
            try {
              /// Authenticating to make sure that the user is really want to delete his account.
              if (user != null) {
                AuthCredential credential = EmailAuthProvider.credential(
                  email: currentUserEmail,
                  password: password.toString(),
                );
                await user.reauthenticateWithCredential(credential);
                await user.delete();
              }

              /// Delete user document from users collection.
              await usersCollection.doc(currentUserEmail).delete();

              /// Delete user profile image from profileImages folder.
              final profileImage = firestorage.ref(AppStrings.profileImagesBase).child(formattedEmail + AppStrings.profileImageNameEndBase);
              await profileImage.delete();

              /// Delete user email from auth user document.
              await FirebaseFirestore.instance.collection(AppStrings.usersCollection).doc(AppStrings.authUsersDocument).set(
                {
                  AppStrings.emailsField: FieldValue.arrayRemove([user!.email])
                },
                SetOptions(merge: true),
              );
              AppDefaults.defaultToast(AppStrings.accountDeletedSuccessfullyToast).then((value) => SystemNavigator.pop());
            } catch (e) {
              AppDefaults.defaultToast(AppStrings.errorDeletingAccountToast + e.toString());
            }
            isLoading.value = false;
          }
        },
        passwordOnSaved: (value) {
          password = value;
        },
      ),
    );
  }

  /// To logout from the whole app.
  void logoutButtonOnClick() {
    AppDefaults.defaultDialogWithConfirmAndCancel(
      title: AppStrings.logoutText,
      subTitle: Text(
        AppStrings.logoutMessageText,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.petrol,
          fontSize: 24.sp,
        ),
      ),
      isLoading: isLoading,
      secondButtonText: AppStrings.logoutText,
      secondButtonClick: () {
        isLoading.value = true;
        FirebaseAuth.instance.signOut().then(
          (value) {
            isLoading.value = false;
            SystemNavigator.pop();
          },
        );
      },
    );
  }
}
