import 'package:doctor_app/screens/message_list.dart';
import 'package:doctor_app/screens/number_of_doctors.dart';
import 'package:flutter/material.dart';

import '../screens/change_password.dart';
import '../screens/forgotten_password.dart';
import '../screens/home_page.dart';
import '../screens/log_in.dart';
import '../screens/onboarding.dart';
import '../screens/password_recovery.dart';
import '../screens/privacy_and_term.dart';
import '../screens/sign_up.dart';
import '../screens/splash_screen.dart';
import '../widget_tree.dart';

class AppRouter {
  static Route<dynamic>? onGeneratedRoute(settings) {
    switch (settings.name) {
      case AppRouterName.splashscreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
      case AppRouterName.onboarding:
        return MaterialPageRoute(
          builder: (context) => const Onboarding(),
          settings: settings,
        );
      case AppRouterName.widgettree:
        return MaterialPageRoute(
          builder: (context) => const WidgetTree(),
          settings: settings,
        );
      case AppRouterName.login:
        return MaterialPageRoute(
          builder: (context) => const Login(
            title: '',
          ),
          settings: settings,
        );
      case AppRouterName.signup:
        return MaterialPageRoute(
          builder: (context) => const SignUp(),
          settings: settings,
        );
      case AppRouterName.forgottenpassword:
        return MaterialPageRoute(
          builder: (context) => const ForgottenPassword(),
          settings: settings,
        );
      case AppRouterName.passwordrecovery:
        return MaterialPageRoute(
          builder: (context) => const PasswordRecovery(),
          settings: settings,
        );
      case AppRouterName.changepassword:
        return MaterialPageRoute(
          builder: (context) => const ChangePassword(),
          settings: settings,
        );
      case AppRouterName.privacyandterm:
        return MaterialPageRoute(
          builder: (context) => const PrivacyAndTerm(),
          settings: settings,
        );
      case AppRouterName.homepage:
        return MaterialPageRoute(
          builder: (context) => const Homepage(),
          settings: settings,
        );
      case AppRouterName.numberofdoctors:
        return MaterialPageRoute(
          builder: (context) => const NumberOfDoctors(),
          settings: settings,
        );
      case AppRouterName.messagelist:
        return MaterialPageRoute(
          builder: (context) => const MessageList(),
          settings: settings,
        );
    }
    return null;
  }
}

class AppRouterName {
  static const splashscreen = "/splashscreen";
  static const onboarding = "/onboarding";
  static const widgettree = "/widgettree";
  static const login = "/login";
  static const signup = "/signup";
  static const forgottenpassword = "/forgottenpassword";
  static const passwordrecovery = "/passwordrecovery";
  static const changepassword = "/changepassword";
  static const privacyandterm = "/privacy_term";
  static const homepage = "/homepage";
  static const numberofdoctors = "/number_of_doctors";
  static const messagelist = "/message_list";
}
