import 'package:doctor_app/view/account/view_model/account_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit()
      : super(AccountState(
          imageUrl: '',
          personalInfoNavigator: '',
          privacyAndTermNavigator: '',
          changePasswordNavigator: '',
        ));

  void setImageUrl(String imageUrl) {
    emit(state.copyWith(imageUrl: imageUrl));
  }

  void setPersonalInfoNavigator(String navigator) {
    emit(state.copyWith(personalInfoNavigator: navigator));
  }

  void setPrivacyAndTermNavigator(String navigator) {
    emit(state.copyWith(privacyAndTermNavigator: navigator));
  }

  void setChangePasswordNavigator(String navigator) {
    emit(state.copyWith(changePasswordNavigator: navigator));
  }
}
