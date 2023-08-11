import 'package:bloc/bloc.dart';
import 'package:doctor_app/view/appointment/view_model/appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit()
      : super(AppointmentState(
          dateTime: DateTime(2023, 07, 01, 5, 30),
          doctorName: "",
          speciality: "",
        ));

  void updateDateTime(DateTime newDateTime) {
    emit(state.copyWith(dateTime: newDateTime));
  }

  void updateDoctorInfo({
    required String doctorName,
    required String speciality,
  }) {
    emit(state.copyWith(doctorName: doctorName, speciality: speciality));
  }
}
