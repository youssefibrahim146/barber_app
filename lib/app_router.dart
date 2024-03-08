import 'package:barber/view/screens/get_started_screen.dart';
import 'package:barber/view/screens/home_screen.dart';
import 'package:barber/view/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import 'constants/strings.dart';
import 'view/screens/login_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case getStartedScreen:
        return MaterialPageRoute(
          builder: (_) => const GetStartedScreen(),
        );
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case signupScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    }
  }
}
