// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctor_app/network/remote/models/doctor_data.dart';

class HomePageState {
  final List<DoctorData> doctorList;
  final bool isItemVisible;
  final bool isSaved;
  HomePageState({
    required this.doctorList,
    required this.isItemVisible,
    required this.isSaved,
  });

  HomePageState copyWith(
      {List<DoctorData>? doctorList, bool? isItemVisible, bool? isSaved}) {
    return HomePageState(
        doctorList: doctorList ?? this.doctorList,
        isItemVisible: isItemVisible ?? this.isItemVisible,
        isSaved: isSaved ?? this.isSaved);
  }
}
