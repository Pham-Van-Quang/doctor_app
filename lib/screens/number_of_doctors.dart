import 'dart:convert';

import 'package:doctor_app/models/doctor_data.dart';
import 'package:doctor_app/router/app_router.dart';
import 'package:doctor_app/widgets/back_button.dart';
import 'package:doctor_app/widgets/doctorview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NumberOfDoctors extends StatefulWidget {
  const NumberOfDoctors({super.key});

  @override
  State<NumberOfDoctors> createState() => _NumberOfDoctorsState();
}

class _NumberOfDoctorsState extends State<NumberOfDoctors> {
  List<DoctorData> doctorList = [];

  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://doctor-app-6caab-default-rtdb.asia-southeast1.firebasedatabase.app/doctor_data_model.json'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final data = await response.stream.bytesToString();
      final dataDecode = jsonDecode(data) as Map<String, dynamic>;
      for (var item in dataDecode.entries) {
        final itemDecode = DoctorData.fromJson(item.value);
        setState(() {
          doctorList.add(itemDecode);
        });
      }
      setState(() {
        doctorList.shuffle();
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(right: 18, left: 18, top: 58),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackButtonCustom(
                onTap: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName(AppRouterName.homepage));
                },
              ),
              Text(
                'Danh sách bác sĩ',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(
                height: 40,
                width: 40,
              )
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
                child: DoctorView(
                    doctorList: doctorList,
                    customItemCount: doctorList.length)),
          )
        ],
      ),
    ));
  }
}
