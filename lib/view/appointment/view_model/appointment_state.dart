class AppointmentState {
  final DateTime dateTime;
  final String doctorName;
  final String speciality;

  AppointmentState({
    required this.dateTime,
    required this.doctorName,
    required this.speciality,
  });

  AppointmentState copyWith({
    DateTime? dateTime,
    String? doctorName,
    String? speciality,
  }) {
    return AppointmentState(
      dateTime: dateTime ?? this.dateTime,
      doctorName: doctorName ?? this.doctorName,
      speciality: speciality ?? this.speciality,
    );
  }
}
