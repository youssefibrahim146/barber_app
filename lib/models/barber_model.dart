import 'package:barber/constants/app_imports.dart';

class BarberModel {
  final String location;
  final String email;
  final String phone;
  final String image;
  final List setDay;
  final List prices;
  final List offers;
  final String name;

  BarberModel({
    required this.location,
    required this.prices,
    required this.offers,
    required this.setDay,
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
      prices: json[AppStrings.pricesField] ?? [],
      offers: json[AppStrings.offersField] ?? [],
      setDay: json[AppStrings.offersField] ?? [],
    );
  }
}
