import 'package:barber/constants/app_imports.dart';

class BarberModel {
  final List reservations;
  final String location;
  final String email;
  final String phone;
  final String image;
  final String name;

  BarberModel({
    required this.reservations,
    required this.location,
    required this.email,
    required this.image,
    required this.phone,
    required this.name,
  });
  
  factory BarberModel.fromMap(Map<String, dynamic> json) {
    return BarberModel(
      image: json[AppStrings.profileImageField] ?? AppStrings.emptySign,
      location: json[AppStrings.locationField] ?? AppStrings.emptySign,
      email: json[AppStrings.emailField] ?? AppStrings.emptySign,
      phone: json[AppStrings.phoneField] ?? AppStrings.emptySign,
      name: json[AppStrings.nameField] ?? AppStrings.emptySign,
      reservations: json[AppStrings.reservationsField] ?? [],
    );
  }
}
