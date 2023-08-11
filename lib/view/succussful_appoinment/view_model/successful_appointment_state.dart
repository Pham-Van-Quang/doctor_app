class SuccessfulAppointmentState {
  final String doctorName;
  final String speciality;
  final String appointmentDate;
  final String appointmentHour;
  SuccessfulAppointmentState({
    required this.doctorName,
    required this.speciality,
    required this.appointmentDate,
    required this.appointmentHour,
  });

  SuccessfulAppointmentState copyWith({
    String? doctorName,
    String? speciality,
    String? appointmentDate,
    String? appointmentHour,
  }) {
    return SuccessfulAppointmentState(
      doctorName: doctorName ?? this.doctorName,
      speciality: speciality ?? this.speciality,
      appointmentDate: appointmentDate ?? this.appointmentDate,
      appointmentHour: appointmentHour ?? this.appointmentHour,
    );
  }
}
