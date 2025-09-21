import 'package:flutter/material.dart';
import 'package:smilecheck_ai/routes/routes.dart';
import 'package:smilecheck_ai/screens/ai_dentist/ai_dentist.dart';
import 'package:smilecheck_ai/screens/daily_reminder_timer/daily_reminder_timer.dart';
import 'package:smilecheck_ai/screens/dashboard_background/dashboard_background.dart';
import 'package:smilecheck_ai/screens/login/login_screen.dart';
import 'package:smilecheck_ai/screens/login_with_email/login_with_email.dart';
import 'package:smilecheck_ai/screens/new_password/new_password.dart';
import 'package:smilecheck_ai/screens/onboarding/onboarding_screen.dart';
import 'package:smilecheck_ai/screens/opt/opt.dart';
import 'package:smilecheck_ai/screens/signup/signup_screen.dart';
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
      case AppRoutes.dashboardBackground:
        return MaterialPageRoute(builder: (context) => DashboardBackground());
      case AppRoutes.aiDentist:
        return MaterialPageRoute(builder: (context) => AiDentist());
      case AppRoutes.dailyReminderTimer:
        return MaterialPageRoute(
          builder: (context) => DailyReminderTimerScreen(),
        );
      case AppRoutes.loginWithEmail:
        return MaterialPageRoute(builder: (context) => LoginWithEmailScreen());
      case AppRoutes.otp:
        return MaterialPageRoute(builder: (context) => OptScreen());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (context) => SignupScreen());
      case AppRoutes.newPassword:
        return MaterialPageRoute(builder: (context) => NewPasswordScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(body: Text('No route avalible')),
        );
    }
  }
}
