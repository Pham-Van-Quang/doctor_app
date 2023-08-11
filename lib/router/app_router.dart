import 'package:doctor_app/network/remote/models/doctor_data.dart';
import 'package:doctor_app/view/account/account.dart';
import 'package:doctor_app/view/appointment/appointment.dart';
import 'package:doctor_app/view/appointment/view_model/appointment_cubit.dart';
import 'package:doctor_app/view/change_password/change_password.dart';
import 'package:doctor_app/view/conversation/conversation.dart';
import 'package:doctor_app/view/conversation/model/conversation_cubit.dart';
import 'package:doctor_app/view/doctor_infor/doctor_infor.dart';
import 'package:doctor_app/view/forgotten_password/forgotten_password.dart';
import 'package:doctor_app/view/forgotten_password/view_model/forgotten_password_cubit.dart';
import 'package:doctor_app/view/home.dart';
import 'package:doctor_app/view/consultation/consultation.dart';
import 'package:doctor_app/view/log_in/log_in.dart';
import 'package:doctor_app/view/log_in/view_model/log_in_cubit.dart';
import 'package:doctor_app/view/number_of_doctors/number_of_doctors.dart';
import 'package:doctor_app/view/onboarding/onboarding.dart';
import 'package:doctor_app/view/personal_infor/personal_infor.dart';
import 'package:doctor_app/view/personal_infor_update/personal_infor_update.dart';
import 'package:doctor_app/view/personal_infor_update/view_model/personal_infor_update_cubit.dart';
import 'package:doctor_app/view/privacy_and_term/privacy_and_term.dart';
import 'package:doctor_app/view/privacy_and_term/view_model/privacy_and_term_cubit.dart';
import 'package:doctor_app/view/sign_up/sign_up.dart';
import 'package:doctor_app/view/sign_up/view_model/sign_up_cubit.dart';
import 'package:doctor_app/view/splash_screen/splash_screen.dart';
import 'package:doctor_app/view/succussful_appoinment/successful_appointment.dart';
import 'package:doctor_app/view/successful_registration/successful_registration.dart';
import 'package:doctor_app/view/succussful_appoinment/view_model/successful_appointment_cubit.dart';
import 'package:doctor_app/view/widget_tree.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const Login(
              title: '',
            ),
          ),
          settings: settings,
        );
      case AppRouterName.signup:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignupCubit(),
            child: const SignUp(),
          ),
          settings: settings,
        );
      case AppRouterName.forgottenpassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ForgottenPasswordCubit(FirebaseAuth.instance),
            child: const ForgottenPassword(),
          ),
          settings: settings,
        );
      case AppRouterName.changepassword:
        return MaterialPageRoute(
          builder: (context) => const ChangePassword(),
          settings: settings,
        );
      case AppRouterName.privacyandterm:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => PrivacyAndTermCubit(),
            child: const PrivacyAndTerm(),
          ),
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
      case AppRouterName.consultation:
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
          builder: (context) => BlocProvider(
            create: (context) => PersonalInforUpdateCubit(),
            child: const PersonalInforUpdate(),
          ),
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
          builder: (context) => BlocProvider(
            create: (context) => ConversationCubit(),
            child: const Conversation(),
          ),
          settings: settings,
        );
      case AppRouterName.successfulregistration:
        return MaterialPageRoute(
          builder: (context) => const SuccessfulRegistration(),
          settings: settings,
        );
      case AppRouterName.appointment:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AppointmentCubit(),
            child: Appointment(
              doctorData: settings.arguments as DoctorData,
            ),
          ),
          settings: settings,
        );
      case AppRouterName.successfulappointment:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SuccessfulAppointmentCubit(),
            child: const SuccessfulAppointment(),
          ),
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
  static const changepassword = "/changepassword";
  static const privacyandterm = "/privacy_term";
  static const homepage = "/homepage";
  static const numberofdoctors = "/number_of_doctors";
  static const consultation = "/consultation";
  static const account = "/account";
  static const personalinfor = "/personalinfor";
  static const personalinforupdate = "/personalinforupdate";
  static const doctorinfor = "/doctorinfor";
  static const conversation = "/conversation";
  static const successfulregistration = "/successful_registration";
  static const appointment = "/appointment";
  static const successfulappointment = "/successfulappointment";
}
