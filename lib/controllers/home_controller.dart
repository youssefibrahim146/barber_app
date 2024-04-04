import 'package:barber/constants/app_imports.dart';

class HomeController extends GetxController {
  static Query usersCollectionWhereEmailEqualsCurrentUserEmail = usersCollection.where(AppStrings.emailField, isEqualTo: currentUserEmail);
  static CollectionReference usersCollection = firestore.collection(AppStrings.usersCollection);
  static String currentUserEmail = fireauth.currentUser!.email ?? AppStrings.emptySign;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseAuth fireauth = FirebaseAuth.instance;

  /// Fetch user data from users collection by his email
  Future<UserModel> fetchUserData() async {
    try {
      QuerySnapshot querySnapshot = await usersCollectionWhereEmailEqualsCurrentUserEmail.get();
      if (querySnapshot.docs.isNotEmpty) {
        return UserModel.fromMap(querySnapshot.docs.first.data() as Map<String, dynamic>);
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
}
