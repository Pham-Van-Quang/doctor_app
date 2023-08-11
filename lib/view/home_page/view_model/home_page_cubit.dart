import 'package:doctor_app/network/data_state/data_state.dart';
import 'package:doctor_app/network/repositories/home_page_repository_impl.dart';
import 'package:doctor_app/view/home_page/view_model/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final HomePageRepositoryImpl _homePageRepository;

  HomePageCubit(this._homePageRepository)
      : super(
            HomePageState(doctorList: [], isItemVisible: true, isSaved: false));

  void getData() async {
    final response = await _homePageRepository.getListDoctorDataItem();
    if (response is DataSuccess) {
      emit(state.copyWith(
        doctorList: response.data?.listDoctorData ?? [],
      ));
    }
  }

  void updateIsItemVisible() {
    emit(state.copyWith(isItemVisible: false));
  }

  void isSaved() {
    emit(state.copyWith(isSaved: !state.isSaved));
  }
}
