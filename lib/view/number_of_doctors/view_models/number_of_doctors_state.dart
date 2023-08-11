import 'package:doctor_app/network/remote/models/doctor_data.dart';

class NumberOfDoctorsState {
  final List<DoctorData> doctorList;
  NumberOfDoctorsState({this.doctorList = const []});

  NumberOfDoctorsState copyWith({required List<DoctorData> doctorList}) {
    return NumberOfDoctorsState(doctorList: doctorList);
  }
}
