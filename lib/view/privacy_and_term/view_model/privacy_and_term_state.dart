class PrivacyAndTermState {
  final bool isShowedTextA;
  final bool isShowedTextB;

  const PrivacyAndTermState({
    required this.isShowedTextA,
    required this.isShowedTextB,
  });

  PrivacyAndTermState copyWith({
    bool? isShowedTextA,
    bool? isShowedTextB,
  }) {
    return PrivacyAndTermState(
      isShowedTextA: isShowedTextA ?? this.isShowedTextA,
      isShowedTextB: isShowedTextB ?? this.isShowedTextB,
    );
  }

  List<Object> get props => [isShowedTextA, isShowedTextB];
}

class PrivacyAndTermInitial extends PrivacyAndTermState {
  const PrivacyAndTermInitial()
      : super(isShowedTextA: false, isShowedTextB: false);
}
