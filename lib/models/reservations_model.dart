import 'package:barber/constants/app_imports.dart';

class ReservationModel {
  final String barberImage;
  final String barberName;
  final String userImage;
  final String userName;
  final DateTime date;

  ReservationModel({
    required this.barberImage,
    required this.barberName,
    required this.userImage,
    required this.userName,
    required this.date,
  });

  factory ReservationModel.fromMap(Map<String, dynamic> json) {
    return ReservationModel(
      barberImage: json[AppStrings.barberImageField] ?? AppStrings.emptySign,
      barberName: json[AppStrings.barberNameField] ?? AppStrings.emptySign,
      userImage: json[AppStrings.userImageField] ?? AppStrings.emptySign,
      userName: json[AppStrings.userNameField] ?? AppStrings.emptySign,
      date: json[AppStrings.dateField] ?? DateTime.now(),
    );
  }
}
