// ignore_for_file: unused_local_variable, unnecessary_string_interpolations

import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/network/data_state/data_state.dart';
import 'package:doctor_app/network/remote/models/doctor_data.dart';
import 'package:doctor_app/network/repositories/home_page_repository_impl.dart';
import 'package:doctor_app/view/authentication.dart';
import 'package:doctor_app/router/app_router.dart';
import 'package:doctor_app/common/notification_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/doctorview.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<DoctorData> doctorList = [];
  bool isItemVisible = true;
  SharedPreferences? prefs;

  @override
  void initState() {
    initSharedPref;
    _getData();
    super.initState();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void _getData() async {
    final response = await HomePageRepositoryImpl().getListDoctorDataItem();
    if (response is DataSuccess) {
      setState(() {
        doctorList = response.data?.listDoctorData ?? [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    String? doctorName = arguments?['doctorName'];
    String? speciality = arguments?['speciality'];
    String? appointmentDate = arguments?['appointmentDate'];
    String? appointmentHour = arguments?['appointmentHour'];
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
                  Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.network(
                            Auth().currentUser?.photoURL ?? "",
                            fit: BoxFit.cover,
                          ))),
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
                        Text(
                            "${FirebaseAuth.instance.currentUser!.displayName}",
                            style: Theme.of(context).textTheme.bodyMedium)
                      ],
                    ),
                  ),
                  Animate(child: NotificationButton()).scale(),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(right: 18, left: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Text('Cuộc hẹn của tôi',
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(height: 26),
                      if (doctorName != null &&
                          speciality != null &&
                          appointmentDate != null &&
                          appointmentHour != null &&
                          isItemVisible)
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: Slidable(
                            endActionPane: ActionPane(
                                extentRatio: 0.2,
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      setState(() {
                                        isItemVisible = false;
                                      });
                                    },
                                    backgroundColor: const Color(0xffF52825),
                                    borderRadius: BorderRadius.circular(8),
                                    foregroundColor: Colors.white,
                                    label: 'Xóa',
                                  ),
                                ]),
                            child: Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xff004080)
                                        .withOpacity(0.04),
                                    blurRadius: 20,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: double.infinity,
                                    width: 72,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: kPrimaryColor,
                                    ),
                                    child: Text(
                                      '$appointmentDate',
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Thời gian: $appointmentHour',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: kTextColor,
                                        ),
                                      ),
                                      Text(
                                        'Bác sĩ: $doctorName',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: kTextColor,
                                        ),
                                      ),
                                      Text(
                                        'Chuyên môn: $speciality',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: kTextColor,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      else
                        Container(
                          height: 50,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 14),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0xff004080)
                                        .withOpacity(0.04),
                                    blurRadius: 20)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Đặt lịch ngay',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AppRouterName.numberofdoctors);
                                },
                                child: SizedBox(
                                    height: 22,
                                    width: 22,
                                    child: Center(
                                        child: SvgPicture.asset(
                                            'assets/icons/add-appointment.svg'))),
                              )
                            ],
                          ),
                        ),
                      const SizedBox(height: 22),
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
                      if (doctorList.isNotEmpty)
                        DoctorView(customItemCount: 3, doctorList: doctorList)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
