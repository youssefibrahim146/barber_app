import 'constants/app_imports.dart';

class AppRouter {
  static List<GetPage> appPages = [
    GetPage(
      name: AppStrings.getStartedRoute,
      page: () => const GetStartedScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppStrings.loginScreenRoute,
      page: () => const LoginScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppStrings.signupScreenRoute,
      page: () => const SignupScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppStrings.homeScreenRoute,
      page: () => const HomeScreen(),
      transition: Transition.noTransition,
    ),
  ];
}
