import 'package:doctor_app/view/sign_up/view_model/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit()
      : super(SignupState(
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
