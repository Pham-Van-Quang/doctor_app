import 'package:doctor_app/view/privacy_and_term/view_model/privacy_and_term_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrivacyAndTermCubit extends Cubit<PrivacyAndTermState> {
  PrivacyAndTermCubit()
      : super(const PrivacyAndTermState(
            isShowedTextA: false, isShowedTextB: false));

  void toggleTextA() {
    emit(state.copyWith(isShowedTextA: !state.isShowedTextA));
  }

  void toggleTextB() {
    emit(state.copyWith(isShowedTextB: !state.isShowedTextB));
  }
}
