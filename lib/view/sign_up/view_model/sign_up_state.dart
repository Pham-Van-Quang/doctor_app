// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shared_preferences/shared_preferences.dart';

class SignupState {
  SharedPreferences? prefs;
  final bool isShowedPassWord;
  final bool isEmailFocused;
  final bool isLockFocused;
  SignupState({
    this.prefs,
    required this.isShowedPassWord,
    required this.isEmailFocused,
    required this.isLockFocused,
  });

  SignupState copyWith(
      {SharedPreferences? prefs,
      bool? isShowedPassWord,
      bool? isEmailFocused,
      bool? isLockFocused}) {
    return SignupState(
      prefs: prefs ?? this.prefs,
      isShowedPassWord: isShowedPassWord ?? this.isShowedPassWord,
      isEmailFocused: isEmailFocused ?? this.isEmailFocused,
      isLockFocused: isLockFocused ?? this.isLockFocused,
    );
  }
}
