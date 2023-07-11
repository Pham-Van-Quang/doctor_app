import 'package:doctor_app/network/remote/models/doctor_data.dart';
import 'package:doctor_app/view/account/account.dart';
import 'package:doctor_app/view/appointment.dart';
import 'package:doctor_app/view/conversation.dart';
import 'package:doctor_app/view/doctor_infor.dart';
import 'package:doctor_app/view/home.dart';
import 'package:doctor_app/view/consultation.dart';
import 'package:doctor_app/view/number_of_doctors.dart';
import 'package:doctor_app/view/personal_infor.dart';
import 'package:doctor_app/view/personal_infor_update.dart';
import 'package:doctor_app/view/successful_appointment.dart';
import 'package:doctor_app/view/successful_registration.dart';
import 'package:flutter/material.dart';
import '../view/change_password.dart';
import '../view/forgotten_password.dart';
import '../view/log_in.dart';
import '../view/onboarding.dart';
import '../view/password_recovery.dart';
import '../view/privacy_and_term.dart';
import '../view/sign_up.dart';
import '../view/splash_screen/view/splash_screen.dart';
import '../view/widget_tree.dart';

class AppRouter {
  static Route<dynamic>? onGeneratedRoute(RouteSettings settings) {
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
          builder: (context) => const Home(),
          settings: settings,
        );
      case AppRouterName.numberofdoctors:
        return MaterialPageRoute(
          builder: (context) => const NumberOfDoctors(),
          settings: settings,
        );
      case AppRouterName.messagelist:
        return MaterialPageRoute(
          builder: (context) => const Consultation(),
          settings: settings,
        );
      case AppRouterName.account:
        return MaterialPageRoute(
          builder: (context) => const Account(),
          settings: settings,
        );
      case AppRouterName.personalinfor:
        return MaterialPageRoute(
          builder: (context) => const PersonalInfor(),
          settings: settings,
        );
      case AppRouterName.personalinforupdate:
        return MaterialPageRoute(
          builder: (context) => const PersonalInforUpdate(),
          settings: settings,
        );
      case AppRouterName.doctorinfor:
        return MaterialPageRoute(
          builder: (context) => DoctorInformation(
            doctorData: settings.arguments as DoctorData,
          ),
          settings: settings,
        );
      case AppRouterName.conversation:
        return MaterialPageRoute(
          builder: (context) => const Conversation(),
          settings: settings,
        );
      case AppRouterName.successfulregistration:
        return MaterialPageRoute(
          builder: (context) => const SuccessfulRegistration(),
          settings: settings,
        );
      case AppRouterName.appointment:
        return MaterialPageRoute(
          builder: (context) => Appointment(
            doctorData: settings.arguments as DoctorData,
          ),
          settings: settings,
        );
      case AppRouterName.successfulappointment:
        return MaterialPageRoute(
          builder: (context) => const SuccessfulAppointment(),
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
  static const account = "/account";
  static const personalinfor = "/personalinfor";
  static const personalinforupdate = "/personalinforupdate";
  static const doctorinfor = "/doctorinfor";
  static const conversation = "/conversation";
  static const successfulregistration = "/successful_registration";
  static const appointment = "/appointment";
  static const successfulappointment = "/successfulappointment";
}
