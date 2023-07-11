class AccountState {
  String imageUrl;
  String personalInfoNavigator;
  String privacyAndTermNavigator;
  String changePasswordNavigator;

  AccountState({
    required this.imageUrl,
    required this.personalInfoNavigator,
    required this.privacyAndTermNavigator,
    required this.changePasswordNavigator,
  });

  AccountState copyWith({
    String? imageUrl,
    String? personalInfoNavigator,
    String? privacyAndTermNavigator,
    String? changePasswordNavigator,
  }) {
    return AccountState(
      imageUrl: imageUrl ?? this.imageUrl,
      personalInfoNavigator:
          personalInfoNavigator ?? this.personalInfoNavigator,
      privacyAndTermNavigator:
          privacyAndTermNavigator ?? this.privacyAndTermNavigator,
      changePasswordNavigator:
          changePasswordNavigator ?? this.changePasswordNavigator,
    );
  }
}
