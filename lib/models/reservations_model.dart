import 'package:barber/constants/app_imports.dart';

class ReservationModel {
  final RxString barberName;
  final RxString userName;
  final RxString date;

  ReservationModel({
    required this.barberName,
    required this.userName,
    required this.date,
  });

  factory ReservationModel.fromMap(Map<String, dynamic> json) {
    return ReservationModel(
      barberName: RxString(json[AppStrings.barberNameField] ?? AppStrings.emptySign),
      userName: RxString(json[AppStrings.userNameField] ?? AppStrings.emptySign),
      date: RxString(json[AppStrings.dateField] ?? AppStrings.emptySign),
    );
  }
}
