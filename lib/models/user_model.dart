import 'package:barber/constants/app_imports.dart';

class UserModel {
  final RxString email;
  final RxString image;
  final RxString phone;
  final RxString name;

  UserModel({
    required this.email,
    required this.image,
    required this.phone,
    required this.name,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      image: RxString(json[AppStrings.profileImageField] ?? AppStrings.emptySign),
      email: RxString(json[AppStrings.emailField] ?? AppStrings.emptySign),
      phone: RxString(json[AppStrings.phoneField] ?? AppStrings.emptySign),
      name: RxString(json[AppStrings.nameField] ?? AppStrings.emptySign),
    );
  }
}
