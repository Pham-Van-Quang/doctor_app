import 'package:doctor_app/network/data_state/data_state.dart';
import 'package:doctor_app/network/remote/apis/home_page_api.dart';
import 'package:doctor_app/network/remote/models/doctor_data.dart';
import 'package:doctor_app/network/repositories/home_page_repository.dart';

class HomePageRepositoryImpl implements HomePageRepository {
  @override
  Future<DataState<GetDoctorDataListItemResponse>>
      getListDoctorDataItem() async {
    final response = await HomePageApi().getListDoctorDataItem();
    if (response.responseCode == 200) {
      return DataSuccess(data: response);
    } else {
      return DataFailed(data: response);
    }
  }
}
