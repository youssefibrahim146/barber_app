import 'package:barber/constants/app_imports.dart';
import 'package:barber/view/screens/barber_details_screen.dart';
import 'package:barber/view/screens/phone_signup_screen.dart';
import 'package:barber/view/screens/sms_code_screen.dart';

class AppRouter {
  static List<GetPage> appPages = [
    GetPage(
      name: AppStrings.barberDetailsRoute,
      page: () => const BarberDetailsScreen(),
      transition: Transition.noTransition,
      transitionDuration: Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: AppStrings.phoneSignupRoute,
      page: () => const PhoneSignupScreen(),
      transition: Transition.noTransition,
      transitionDuration: Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: AppStrings.getStartedRoute,
      page: () => const GetStartedScreen(),
      transition: Transition.noTransition,
      transitionDuration: Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: AppStrings.signupRoute,
      page: () => const SignupScreen(),
      transition: Transition.noTransition,
      transitionDuration: Duration(
        milliseconds: 2500,
      ),
    ),
    GetPage(
      name: AppStrings.loginRoute,
      page: () => const LoginScreen(),
      transition: Transition.noTransition,
      transitionDuration: Duration(
        milliseconds: 2500,
      ),
    ),
    GetPage(
      name: AppStrings.sMSCodeRoute,
      page: () => const SMSCodeScreen(),
      transition: Transition.noTransition,
      transitionDuration: Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: AppStrings.homeRoute,
      page: () => const HomeScreen(),
      transition: Transition.noTransition,
      transitionDuration: Duration(
        milliseconds: 500,
      ),
    ),
  ];
}
