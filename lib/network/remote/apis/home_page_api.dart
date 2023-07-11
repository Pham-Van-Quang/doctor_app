import 'dart:convert';

import 'package:doctor_app/network/configs/network_constants.dart';
import 'package:doctor_app/network/remote/models/doctor_data.dart';
import 'package:http/http.dart' as http;

class HomePageApi {
  Future<GetDoctorDataListItemResponse> getListDoctorDataItem() async {
    var request = http.Request(
        'GET', Uri.parse('${NetworkConstants.baseUrl}/doctor_data_model.json'));
    http.StreamedResponse response = await request.send();

    final data = await response.stream.bytesToString();
    final dataDecode = jsonDecode(data) as Map<String, dynamic>;
    List<DoctorData> doctorList = [];
    for (var item in dataDecode.entries) {
      final itemDecode = DoctorData.fromJson(item.value);
      doctorList.add(itemDecode);
    }
    doctorList.shuffle();
    return GetDoctorDataListItemResponse(
        listDoctorData: doctorList, responseCode: response.statusCode);
  }
}
