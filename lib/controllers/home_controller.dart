import 'package:barber/constants/app_imports.dart';

class HomeController extends GetxController {
  static Query usersCollectionWhereEmailEqualsCurrentUserEmail = usersCollection.where(AppStrings.emailField, isEqualTo: currentUserEmail);
  static CollectionReference usersCollection = firestore.collection(AppStrings.usersCollection);
  static String currentUserEmail = fireauth.currentUser!.email ?? AppStrings.emptySign;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseAuth fireauth = FirebaseAuth.instance;
  RxString userName = RxString(AppStrings.emptySign);
  RxString userImage = RxString(AppStrings.emptySign);
  RxBool isHome = RxBool(true);

  /// Fetch user data from users collection by his email
  Future<UserModel> fetchUserData() async {
    try {
      QuerySnapshot querySnapshot = await usersCollectionWhereEmailEqualsCurrentUserEmail.get();
      if (querySnapshot.docs.isNotEmpty) {
        UserModel user = UserModel.fromMap(querySnapshot.docs.first.data() as Map<String, dynamic>);
        userName = user.name;
        userImage = user.image;
        return user;
      } else {
        return UserModel(
          email: RxString(AppStrings.notAvailableText),
          image: RxString(AppStrings.notAvailableText),
          name: RxString(AppStrings.notAvailableText),
        );
      }
    } catch (e) {
      AppDefaults.defaultToast(AppStrings.errorFetchingToast + e.toString());
      return UserModel(
        email: RxString(AppStrings.notAvailableText),
        image: RxString(AppStrings.notAvailableText),
        name: RxString(AppStrings.notAvailableText),
      );
    }
  }

  void appBarOnClick() {
    Get.toNamed(AppStrings.userProfileRoute)!.then((value) => isHome = RxBool(false));
  }
}
