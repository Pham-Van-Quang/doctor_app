import 'package:doctor_app/screens/acount/account.dart';

import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/models/doctor_data.dart';
import 'package:doctor_app/screens/home_page.dart';
import 'package:doctor_app/screens/message_list.dart';
import 'package:doctor_app/screens/number_of_doctors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<DoctorData> doctorList = [];

  int selectedIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final pages = <Widget>[
    const Homepage(),
    const NumberOfDoctors(),
    const MessageList(),
    const Account()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: pages[selectedIndex],
          ),
          BottomNavigationBar(
              currentIndex: selectedIndex,
              elevation: 1,
              backgroundColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(selectedIndex == 0
                      ? "assets/icons/homepage.svg"
                      : "assets/icons/homepage-stroke.svg"),
                  label: "Trang chủ",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(selectedIndex == 1
                      ? "assets/icons/calendar.svg"
                      : "assets/icons/calendar-stroke.svg"),
                  label: "Đặt lịch",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(selectedIndex == 2
                      ? "assets/icons/message.svg"
                      : "assets/icons/message-stroke.svg"),
                  label: "Tin nhắn",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(selectedIndex == 3
                      ? "assets/icons/account.svg"
                      : "assets/icons/account-stroke.svg"),
                  label: "Tài khoản",
                ),
              ],
              onTap: onTabSelected,
              showSelectedLabels: true,
              selectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
              selectedItemColor: kPrimaryColor,
              unselectedItemColor: const Color(0xff000000).withOpacity(0.5),
              selectedIconTheme: const IconThemeData(color: kPrimaryColor),
              unselectedIconTheme: IconThemeData(
                  color: const Color(0xff000000).withOpacity(0.5)))
        ],
      ),
    );
  }
}
