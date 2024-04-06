import 'package:barber/constants/app_imports.dart';
import 'package:intl/intl.dart';

class BarberDetailsController extends GetxController {
  static CollectionReference barbersCollection = firestore.collection(AppStrings.barbersCollection);
  static CollectionReference usersCollection = firestore.collection(AppStrings.usersCollection);
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseStorage firestorage = FirebaseStorage.instance;
  HomeController homeController = Get.find();
  BarberModel barber = Get.arguments;
  DateTime now = DateTime.now();

  void phoneButtonOnClick() {
    launch(AppStrings.telText + barber.phone);
  }

  void locationButtonOnClick() {
    launch(barber.location);
  }

  int getDaysInCurrentMonth() {
    DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
    DateTime firstDayOfNextMonth = DateTime(now.year, now.month + 1, 1);
    Duration difference = firstDayOfNextMonth.difference(firstDayOfMonth);
    int daysInMonth = difference.inDays;
    return daysInMonth;
  }

  List<String> getFirstSevenDaysInCurrentMonth() {
    List<String> firstSevenDays = [];
    for (int i = 1; i <= 7; i++) {
      DateTime currentDate = DateTime(now.year, now.month, i);
      String dayName = DateFormat(AppStrings.dayFormat).format(currentDate);
      firstSevenDays.add(dayName.substring(0, 2));
    }
    return firstSevenDays;
  }

  /// To add day into the reservations collection
  void onDayClick(String day) async {
    var connection = await InternetConnectionChecker().hasConnection;
    if (connection == true) {
      try {
        await usersCollection.doc(homeController.currentUser.value.email.value).update(
          {
            AppStrings.reservationsField: [
              {
                AppStrings.barberLocationField: barber.location,
                AppStrings.barberPhoneField: barber.phone,
                AppStrings.barberImageField: barber.image,
                AppStrings.barberNameField: barber.name,
                AppStrings.dateField: day + DateFormat(AppStrings.monthYearFormat).format(now),
              },
            ],
          },
        );
        DocumentSnapshot<Map<String, dynamic>> barberDoc = await barbersCollection.doc(barber.key).get() as DocumentSnapshot<Map<String, dynamic>>;
        List<dynamic> setDayList = barberDoc.data()?[AppStrings.setDayField] ?? [];
        int index = setDayList.indexWhere((map) => map[AppStrings.dateField] == day + DateFormat(AppStrings.monthYearFormat).format(now));
        if (index != -1) {
          List<dynamic> usersList = setDayList[index][AppStrings.usersField] ?? [];
          usersList.add(homeController.currentUser.value.phone.value);
          setDayList[index][AppStrings.usersField] = usersList;
        } else {
          Map<String, dynamic> newMap = {
            AppStrings.dateField: day + DateFormat(AppStrings.monthYearFormat).format(now),
            AppStrings.usersField: [homeController.currentUser.value.phone.value],
          };
          setDayList.add(newMap);
        }
        await barbersCollection.doc(barber.key).update({
          AppStrings.setDayField: setDayList,
        });
        AppDefaults.defaultToast(AppStrings.successfullySetToast);
        homeController.fetchUserData();
        homeController.allBarbers = [];
        homeController.fetchBarbersData();
        Get.offAllNamed(AppStrings.homeRoute);
      } on FirebaseAuthException catch (e) {
        AppDefaults.defaultToast(AppFormats.myFormatter(e.toString(), AppStrings.spaceSign));
      } catch (e) {
        AppDefaults.defaultToast(AppFormats.myFormatter(e.toString(), AppStrings.spaceSign));
      }
    } else {
      AppDefaults.defaultToast(AppStrings.connectionErrorToast);
    }
  }
}
