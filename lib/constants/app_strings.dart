class AppStrings {
  /// App
  static const String appTitle = "Barber";

  /// Routes
  static const String forgotPasswordRouteRoute = "/forgotPassword";
  static const String barberDetailsRoute = "/barberDetails";
  static const String userProfileRoute = "/userProfile";
  static const String phoneSignupRoute = "/phoneSignup";
  static const String sMSCodeRoute = "/smsCode";
  static const String signupRoute = "/signup";
  static const String getStartedRoute = "/";
  static const String loginRoute = "/login";
  static const String homeRoute = "/home";

  /// Firebase Collection, Document & Field Names
  static const String receiverProfileImageField = "receiverProfileImage";
  static const String senderProfileImageField = "senderProfileImage";
  static const String profileImageField = "profileImage";
  static const String chatRoomsCollection = "chatRooms";
  static const String phoneNumberField = "phoneNumber";
  static const String descriptionField = "description";
  static const String chatRoomIdsField = "chatRoomIds";
  static const String senderEmailField = "senderEmail";
  static const String messagesCollection = "messages";
  static const String authUsersDocument = "authUsers";
  static const String chatRoomsField = "chatRooms";
  static const String userEmailField = "userEmail";
  static const String userImageField = "userImage";
  static const String userPhoneField = "userPhone";
  static const String timestampField = "timestamp";
  static const String imageUrlsField = "imageUrls";
  static const String conditionField = "condition";
  static const String categoryField = "category";
  static const String locationField = "location";
  static const String postsCollection = "posts";
  static const String usersCollection = "users";
  static const String messageField = "message";
  static const String emailsField = "emails";
  static const String imagesField = "images";
  static const String isSeenField = "isSeen";
  static const String namesField = "names";
  static const String emailField = "email";
  static const String titleField = "title";
  static const String priceField = "price";
  static const String nameField = "name";
  static const String cityField = "city";
  static const String areaField = "area";
  static const String iconField = "icon";
  static const String viewField = "view";
  static const String keyField = "key";
  static const String favField = "fav";

  /// Extensions
  static const String imagesExtension = ".jpg";

  /// Base URLs
  static const String profileImageNameEndBase = "_profile_image.jpg";
  static const String profileImagesBase = "profileImages/";
  static const String postsImagesBase = "postsImages/";
  static const String imagesTypeBase = "image/jpg";

  /// Signs
  static const String closingSquareBracketSign = "]";
  static const String openingSquareBracketSign = "[";
  static const String closingParenthesisSign = ")";
  static const String openingParenthesisSign = "(";
  static const String closingCurlyBraceSign = "}";
  static const String openingCurlyBraceSign = "{";
  static const String wordsSeparatorSign = ", ";
  static const String ellipsisSign = ".....";
  static const String commaSpaceSign = ", ";
  static const String percentageSign = "%";
  static const String underscoreSign = "_";
  static const String twoSpacesSign = "  ";
  static const String backSlashSign = "/";
  static const String emoticonSign = ":-";
  static const String plusTwoSign = "+2";
  static const String asteriskSign = "*";
  static const String questionSign = "?";
  static const String newLineSign = "\n";
  static const String periodSign = ".";
  static const String hyphenSign = "-";
  static const String commaSign = ",";
  static const String caretSign = "^";
  static const String colonSign = ":";
  static const String spaceSign = " ";
  static const String emptySign = "";
  static const String plusSign = "+";
  static const String bangSign = "!";
  static const String hashSign = "#";
  static const String andSign = "&";
  static const String atSign = "@";
  static const String orSign = "|";

  /// Toasts

  static const String emailSentSuccessfullyToast =
      "Email sent successfully, please check your email to reset your password.";
  static const String yourEmailNotInOurDatabaseToast =
      "Your email is not in our database, Try to signup with that email.";
  static const String passwordChangedSuccessfullyToast =
      "Password changed successfully.";
  static const String accountDeletedSuccessfullyToast =
      "Account deleted successfully.";
  static const String connectionErrorToast =
      "Please check your internet connection.";
  static const String selectConditionToast =
      "PLease select condition for your item.";
  static const String selectCategoryToast =
      "PLease select category for your item.";
  static const String imageFailedUploadingToast =
      "Failed uploading your image.";
  static const String verifyEmailFirstToast = "Please verify your email first.";
  static const String emailCanNotBeEditedToast = "Email field can't be edited.";
  static const String errorResettingPasswordToast = "Error resetting password.";
  static const String uploadImageToast = "PLease upload image for your item.";
  static const String itemAlreadyOpenedToast = "This item is already opened.";
  static const String errorCreatingNewChatToast = "Error creating new chat: ";
  static const String errorDeletingAccountToast = "Error deleting account: ";
  static const String deletedSuccessfullyToast = "Deleted successfully.";
  static const String updatedSuccessfullyToast = "Updated successfully.";
  static const String emptyMessageToast = "can't send empty message.";
  static const String errorUploadingToast = "Error uploading: ";
  static const String imageEditToast = "Image can't be edited.";
  static const String errorDeletingToast = "Error deleting: ";
  static const String errorFetchingToast = "Error fetching: ";
  static const String errorUpdatingToast = "Error updating: ";

  /// Validations

  static const String oldPasswordLargerThen24Validate =
      "Old password can't be larger then 24 letters";
  static const String newPasswordLargerThen24Validate =
      "New password can't be larger then 24 letters";
  static const String oldPasswordLessThen8Validate =
      " Old password can't be less then 8 letters";
  static const String newPasswordLessThen8Validate =
      " New password can't be less then 8 letters";
  static const String passwordLargerThen24Validate =
      "Password can't be larger then 24 letters";
  static const String nameLargerThen24Validate =
      "User name can't be larger then 24 letters";
  static const String phoneNumberBadlyFormattedValidate =
      "Phone Number is badly formatted";
  static const String badlyFormattedPhoneNumberValidate =
      "Phone Number is badly formatted";
  static const String passwordLessThen8Validate =
      "Password can't be less then 8 letters";
  static const String nameLessThen4Validate =
      "User name can't be less then 4 letters";
  static const String phoneNumberEmptyValidate =
      "Please enter your phone number";

  static const String newPasswordEmptyValidate = "New password can't be empty";
  static const String oldPasswordEmptyValidate = "Old password can't be empty";
  static const String emailEmptyValidate = "Email address can't be empty";
  static const String emailMessingAtSignValidate = "Email is messing '@'";
  static const String invalidPhoneNumberValidate = "Invalid Phone Number";
  static const String passwordEmptyValidate = "Password can't be empty";
  static const String nameEmptyValidate = "User name can't be empty";

  /// Hero tags
  static const String containerTag = "container";
  static const String appBarTag = "appBar";
  static const String imageTag = "image";
  static const String textTag = "text";

  /// Assets
  static const String signupAsset = "assets/images/signupImage.png";
  static const String loginAsset = "assets/images/login-logo.png";
  static const String logoAsset = "assets/icons/barber logo.png";

  /// Screens Titles, SubTitles
  static const String getStatedSubTitle =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
  static const String getStatedTitle =
      "Book Your Schedule$newLineSign With Your favorite$newLineSign Barber";

  /// Other
  static const String signupWithPhoneNumberText = "Signup with Phone Number";
  static const String loginWithPhoneNumberText = "Login with Phone Number";
  static const String accountSettingText = "Account Setting";
  static const String changePasswordText = "Change Password";
  static const String deleteAccountText = "Delete Account";
  static const String alreadyUserText = "Already a User?";
  static const String notAvailableText = "Not Available";
  static const String reservationsText = "Reservations";
  static const String editProfileText = "Edit Profile";
  static const String phoneNumberText = "Phone Number";
  static const String notUserText = "Not a User yet?";
  static const String getStartedText = "Get Started";
  static const String firstNameText = "First Name";
  static const String contactUsText = "Contact Us";
  static const String userNameText = "User Name";
  static const String lastNameText = "Last Name";
  static const String passwordText = "Password";
  static const String welcomeText = "Welcome";
  static const String logoutText = "Logout";
  static const String signupText = "Signup";
  static const String loginText = "Login";
  static const String emailText = "Email";
  static const String moreText = "More";
}
