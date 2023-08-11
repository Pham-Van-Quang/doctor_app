import 'package:doctor_app/view/succussful_appoinment/view_model/successful_appointment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessfulAppointmentCubit extends Cubit<SuccessfulAppointmentState> {
  SuccessfulAppointmentCubit()
      : super(SuccessfulAppointmentState(
            appointmentDate: '',
            appointmentHour: '',
            doctorName: '',
            speciality: ''));

  void loadData(Map<String, dynamic> arguments) {
    final doctorName = arguments['doctorName'];
    final speciality = arguments['speciality'];
    final appointmentTime = arguments['appointmentTime'];
    final appointmentDate = '${appointmentTime.day}/${appointmentTime.month}';
    final appointmentHour =
        '${appointmentTime.hour} : ${appointmentTime.minute}';

    emit(state.copyWith(
      doctorName: doctorName,
      speciality: speciality,
      appointmentDate: appointmentDate,
      appointmentHour: appointmentHour,
    ));
  }
}
