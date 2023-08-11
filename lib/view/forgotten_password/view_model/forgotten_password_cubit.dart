import 'package:doctor_app/view/forgotten_password/view_model/forgotten_password_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgottenPasswordCubit extends Cubit<ForgottenPasswordState> {
  final FirebaseAuth _firebaseAuth;
  ForgottenPasswordCubit(this._firebaseAuth)
      : super(ForgottenPasswordState(
            isEmailFocused: false, isResettingPassword: false));

  Future<void> resetPassword(String email) async {
    try {
      emit(state.copyWith(isResettingPassword: true));
      await _firebaseAuth.sendPasswordResetEmail(email: email.trim());
      emit(state.copyWith(isResettingPassword: false));
    } on FirebaseAuthException catch (e) {
      print(e);
      emit(state.copyWith(isResettingPassword: false));
    }
  }

  void isEmailFocused() {
    emit(state.copyWith(isEmailFocused: !state.isEmailFocused));
  }
}
