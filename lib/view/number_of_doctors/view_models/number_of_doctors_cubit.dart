import 'package:doctor_app/network/data_state/data_state.dart';
import 'package:doctor_app/network/repositories/home_page_repository_impl.dart';
import 'package:doctor_app/view/number_of_doctors/view_models/number_of_doctors_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberOfDoctorsCubit extends Cubit<NumberOfDoctorsState> {
  final HomePageRepositoryImpl _homePageRepository;
  NumberOfDoctorsCubit(this._homePageRepository)
      : super(NumberOfDoctorsState(doctorList: []));

  void getData() async {
    final response = await _homePageRepository.getListDoctorDataItem();
    if (response is DataSuccess) {
      emit(state.copyWith(
        doctorList: response.data?.listDoctorData ?? [],
      ));
    }
  }
}
