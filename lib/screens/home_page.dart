import 'dart:convert';

import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/models/doctor_data.dart';
import 'package:doctor_app/router/app_router.dart';
import 'package:doctor_app/widgets/notification_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widgets/bottom_app_bar.dart';
import '../widgets/doctorview.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 58, right: 18, left: 18, bottom: 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(
                      'assets/images/avatar.jpg',
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 110),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Xin chào,',
                          style: TextStyle(
                              fontSize: 14,
                              color: kTextColor,
                              fontWeight: FontWeight.normal),
                        ),
                        Text('Phạm Quang',
                            style: Theme.of(context).textTheme.bodyMedium)
                      ],
                    ),
                  ),
                  NotificationButton(),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(right: 18, left: 18),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 22),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          'assets/images/banner.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Danh sách bác sĩ',
                              style: Theme.of(context).textTheme.bodyMedium),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRouterName.numberofdoctors);
                            },
                            child: const Text(
                              'Xem thêm',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  color: kTextColor,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 26),
                      DoctorView(customItemCount: 3, doctorList: doctorList)
                    ],
                  ),
                ),
              ),
            ),
            const BottomBar(),
          ],
        ),
      ),
    );
  }
}
