import 'package:doctor_app/network/data_state/data_state.dart';
import 'package:doctor_app/network/remote/models/doctor_data.dart';

abstract class HomePageRepository {
  Future<DataState<GetDoctorDataListItemResponse>> getListDoctorDataItem();
}
