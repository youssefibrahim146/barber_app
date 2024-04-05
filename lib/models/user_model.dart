import 'package:barber/constants/app_imports.dart';

class UserModel {
  final RxList reservations;
  final RxString email;
  final RxString image;
  final RxString phone;
  final RxString name;

  UserModel({
    required this.reservations,
    required this.email,
    required this.image,
    required this.phone,
    required this.name,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      image: RxString(json[AppStrings.profileImageField] ?? AppStrings.emptySign),
      reservations: RxList(json[AppStrings.reservationsField] ?? RxList()),
      email: RxString(json[AppStrings.emailField] ?? AppStrings.emptySign),
      phone: RxString(json[AppStrings.phoneField] ?? AppStrings.emptySign),
      name: RxString(json[AppStrings.nameField] ?? AppStrings.emptySign),
    );
  }
}
