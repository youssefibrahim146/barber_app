import 'dart:io';

import 'package:barber/constants/app_imports.dart';

class SignupController extends GetxController {
  static CollectionReference usersCollection =
      firestore.collection(AppStrings.usersCollection);
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseAuth fireauth = FirebaseAuth.instance;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  String? userName, emailAddress, password;
  Rx<File?> image = Rx<File?>(null);
  RxBool isLoading = false.obs;
  RxBool isObscure = true.obs;

  /// Pick user profile image from the phone gallery
  void pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  /// Validate on the user data before signup to make sure that the data is valid.
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
            UserCredential userCredential =
                await fireauth.createUserWithEmailAndPassword(
              email: emailAddress!,
              password: password!,
            );
            if (userCredential.user!.emailVerified == false) {
              await fireauth.currentUser!.sendEmailVerification();
              await fireauth.signOut();
              await usersCollection.doc(emailAddress).set({
                AppStrings.nameField: userName,
                AppStrings.emailField: emailAddress,
                AppStrings.profileImageField: imageUrl,
              });
              await usersCollection.doc(AppStrings.authUsersDocument).set(
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
          AppDefaults.defaultToast(
              AppFormats.myFormatter(e.toString(), AppStrings.spaceSign));
        } catch (e) {
          isLoading.value = false;
          AppDefaults.defaultToast(
              AppFormats.myFormatter(e.toString(), AppStrings.spaceSign));
        }
      } else {
        isLoading.value = false;
        AppDefaults.defaultToast(AppStrings.connectionErrorToast);
      }
    }
  }

  /// Upload the user profile image on profileImages/user_email_formatted_profile_image.jpg fire storage and return the image URL.
  Future<String?> uploadUserImage(String emailAddress, Rx<File?> image) async {
    try {
      if (image.value != null) {
        String formattedEmail =
            AppFormats.myFormatter(emailAddress, AppStrings.underscoreSign);
        final storageReference = FirebaseStorage.instance.ref().child(
            AppStrings.profileImagesBase +
                formattedEmail +
                AppStrings.profileImageNameEndBase);
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

  /// Go to login screen if the signup operation is successful.
  void signupButtonOnClick() async {
    UserCredential res = await signUpValidator();
    if (res != null) {
      Get.offAllNamed(AppStrings.loginRoute);
    }
  }

  /// Change the password field text obscure by the Eye icon button.
  void passwordObscureOnClick() {
    isObscure.value = !isObscure.value;
  }

  /// Go to signup with phone number screen from signup screen by the Signup With Phone Number text button.
  void signupWithPhoneNumberTextOnClick() {
    Get.toNamed(AppStrings.phoneSignupRoute);
  }

  /// Go to login screen from signup screen by the Login text button.
  void loginTextOnClick() {
    Get.offNamed(AppStrings.loginRoute);
  }
}
