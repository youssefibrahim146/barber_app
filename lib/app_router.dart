import 'package:barber/view/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import 'constants/strings.dart';
import 'view/screens/login_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case signupScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
    }
  }
}
