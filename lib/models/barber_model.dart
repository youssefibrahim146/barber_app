import 'package:barber/constants/app_imports.dart';

class BarberModel {
  final String location;
  final RxList setDay;
  final String email;
  final String phone;
  final String image;
  final List prices;
  final List offers;
  final String name;
  final String key;

  BarberModel({
    required this.location,
    required this.prices,
    required this.offers,
    required this.setDay,
    required this.email,
    required this.image,
    required this.phone,
    required this.name,
    required this.key,
  });

  factory BarberModel.fromMap(Map<String, dynamic> json, String key) {
    return BarberModel(
      key: key,
      image: json[AppStrings.profileImageField] ?? AppStrings.emptySign,
      location: json[AppStrings.locationField] ?? AppStrings.emptySign,
      email: json[AppStrings.emailField] ?? AppStrings.emptySign,
      phone: json[AppStrings.phoneField] ?? AppStrings.emptySign,
      name: json[AppStrings.nameField] ?? AppStrings.emptySign,
      prices: json[AppStrings.pricesField] ?? [],
      offers: json[AppStrings.offersField] ?? [],
      setDay: RxList(json[AppStrings.setDayField]),
    );
  }
}
