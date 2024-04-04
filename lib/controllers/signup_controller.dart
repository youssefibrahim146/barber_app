import 'dart:io';

import 'package:barber/constants/app_imports.dart';

class SignupController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  Rx<File?> image = Rx<File?>(null);
  RxBool isLoading = false.obs;
  RxBool isObscure = true.obs;
  String? userName, emailAddress, password;

  void pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  signUpValidator() async {
    FocusManager.instance.primaryFocus?.unfocus();
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();
      isLoading.value = true;
      var connection = await InternetConnectionChecker().hasConnection;
      if (connection == true) {
        try {
          String? imageUrl = await uploadUserImage(emailAddress!, image);
          if (imageUrl != null) {
            UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailAddress!,
              password: password!,
            );
            if (userCredential.user!.emailVerified == false) {
              await FirebaseAuth.instance.currentUser!.sendEmailVerification();
              await FirebaseAuth.instance.signOut();
              await FirebaseFirestore.instance.collection(AppStrings.usersCollection).doc(emailAddress).set({
                AppStrings.nameField: userName,
                AppStrings.emailField: emailAddress,
                AppStrings.profileImageField: imageUrl,
              });
              await FirebaseFirestore.instance.collection(AppStrings.usersCollection).doc(AppStrings.authUsersDocument).set(
                {
                  AppStrings.emailsField: FieldValue.arrayUnion([emailAddress!])
                },
                SetOptions(merge: true),
              ).then(
                (value) => Get.offAllNamed(AppStrings.loginRoute),
              );
            } else {
              return userCredential;
            }
          } else {
            isLoading.value = false;
            AppDefaults.defaultToast(AppStrings.imageFailedUploadingToast);
          }
        } on FirebaseAuthException catch (e) {
          isLoading.value = false;
          AppDefaults.defaultToast(AppFormats.myFormatter(e.toString(), AppStrings.spaceSign));
        } catch (e) {
          isLoading.value = false;
          AppDefaults.defaultToast(AppFormats.myFormatter(e.toString(), AppStrings.spaceSign));
        }
      } else {
        isLoading.value = false;
        AppDefaults.defaultToast(AppStrings.connectionErrorToast);
      }
    }
  }

  Future<String?> uploadUserImage(String emailAddress, Rx<File?> image) async {
    try {
      if (image.value != null) {
        String formattedEmail = AppFormats.myFormatter(emailAddress, AppStrings.underscoreSign);
        final storageReference = FirebaseStorage.instance.ref().child(AppStrings.profileImagesBase + AppStrings.backSlashSign + formattedEmail + AppStrings.profileImageNameEndBase);
        final UploadTask uploadTask = storageReference.putFile(
          image.value!,
          SettableMetadata(
            contentType: AppStrings.imagesTypeBase,
          ),
        );
        await uploadTask.whenComplete(() => null);
        return await storageReference.getDownloadURL();
      } else {
        return null;
      }
    } catch (e) {
      print(AppStrings.errorUploadingToast + e.toString());
      return null;
    }
  }

  void signupButtonOnClick() async {
    UserCredential res = await signUpValidator();
    if (res != null) {
      Get.offAllNamed(AppStrings.loginRoute);
    }
  }

  void obscureOnClick() {
    isObscure.value = !isObscure.value;
  }

  void signupWithPhoneNumberTextOnClick() {}

  void loginTextOnClick() {
    Get.offNamed(AppStrings.loginRoute);
  }
}
