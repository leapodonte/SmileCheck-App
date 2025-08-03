import 'package:flutter/material.dart';
import 'package:smilecheck_ai/routes/routes.dart';
import 'package:smilecheck_ai/screens/login/login_screen.dart';
import 'package:smilecheck_ai/screens/onboarding/onboarding_screen.dart';
import 'package:smilecheck_ai/screens/start/start_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());
      case AppRoutes.start:
        return MaterialPageRoute(builder: (context) => StartScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(body: Text('No route avalible')),
        );
    }
  }
}
