import 'package:barber/constants/app_imports.dart';

class HomeController extends GetxController {
  Rx<UserModel> currentUser = Rx<UserModel>(
    UserModel(
      email: RxString(AppStrings.notAvailableText),
      image: RxString(AppStrings.notAvailableText),
      phone: RxString(AppStrings.notAvailableText),
      name: RxString(AppStrings.notAvailableText),
      reservations: RxList<ReservationModel>(),
    ),
  );
  static Query usersCollectionWhereEmailEqualsCurrentUserEmail = usersCollection.where(AppStrings.emailField, isEqualTo: currentUserEmail);
  static CollectionReference usersCollection = firestore.collection(AppStrings.usersCollection);
  static String currentUserEmail = fireauth.currentUser!.email ?? AppStrings.emptySign;
  TextEditingController searchController = TextEditingController();
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseAuth fireauth = FirebaseAuth.instance;
  List<BarberModel> allBarbers = [];
  RxBool isHome = RxBool(true);

  void searchOnClick() {
    if (!searchController.text.isEmpty) {
      FocusManager.instance.primaryFocus?.unfocus();
      Get.toNamed(AppStrings.searchRoute, arguments: [allBarbers.where((barber) => barber.name.contains(searchController.text)).toList(), searchController.text]);
      searchController.text = AppStrings.emptySign;
    } else {
      FocusManager.instance.primaryFocus?.unfocus();
      AppDefaults.defaultToast(AppStrings.enterValidDataToast);
    }
  }

  /// Fetch user data from users collection by his email
  Future<UserModel> fetchUserData() async {
    try {
      QuerySnapshot querySnapshot = await usersCollectionWhereEmailEqualsCurrentUserEmail.get();
      if (querySnapshot.docs.isNotEmpty) {
        UserModel user = UserModel.fromMap(querySnapshot.docs.first.data() as Map<String, dynamic>);
        currentUser.value = user;
        return user;
      } else {
        return UserModel(
          email: RxString(AppStrings.notAvailableText),
          image: RxString(AppStrings.notAvailableText),
          phone: RxString(AppStrings.notAvailableText),
          name: RxString(AppStrings.notAvailableText),
          reservations: RxList<ReservationModel>(),
        );
      }
    } catch (e) {
      AppDefaults.defaultToast(AppStrings.errorFetchingToast + e.toString());
      return UserModel(
        email: RxString(AppStrings.notAvailableText),
        image: RxString(AppStrings.notAvailableText),
        phone: RxString(AppStrings.notAvailableText),
        name: RxString(AppStrings.notAvailableText),
        reservations: RxList<ReservationModel>(),
      );
    }
  }

  /// To fetch all barbers data from barbers collection.
  Future<List<BarberModel>> fetchBarbersData() async {
    List<BarberModel> barbers = [];
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance.collection(AppStrings.barbersCollection).get();
      for (QueryDocumentSnapshot<Map<String, dynamic>> docSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data = docSnapshot.data();
        BarberModel barber = BarberModel.fromMap(data, docSnapshot.id);
        barbers.add(barber);
        allBarbers = barbers;
      }
    } catch (e) {
      AppDefaults.defaultToast(AppStrings.errorFetchingToast + e.toString());
    }
    return barbers;
  }

  void profileOnClick() {
    Get.toNamed(AppStrings.userProfileRoute)!.then((value) => isHome = RxBool(false));
  }

  void barberOnClick(BarberModel barber) {
    Get.offNamed(AppStrings.barberDetailsRoute, arguments: barber);
  }
}
