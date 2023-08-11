import 'package:doctor_app/view/log_in/view_model/log_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(LoginState(
            isShowedPassWord: true,
            isEmailFocused: false,
            isLockFocused: false));

  void initSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(state.copyWith(prefs: prefs));
  }

  void isShowedPassWord() {
    emit(state.copyWith(isShowedPassWord: !state.isShowedPassWord));
  }

  void isEmailFocused() {
    emit(state.copyWith(isEmailFocused: !state.isEmailFocused));
  }

  void isLockFocused() {
    emit(state.copyWith(isLockFocused: !state.isLockFocused));
  }
}
