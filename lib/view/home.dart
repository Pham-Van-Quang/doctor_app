import 'package:doctor_app/network/repositories/home_page_repository_impl.dart';
import 'package:doctor_app/view/account/account.dart';
import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/network/remote/models/doctor_data.dart';
import 'package:doctor_app/view/home_page/home_page.dart';
import 'package:doctor_app/view/consultation/consultation.dart';
import 'package:doctor_app/view/home_page/view_model/home_page_cubit.dart';
import 'package:doctor_app/view/number_of_doctors/number_of_doctors.dart';
import 'package:doctor_app/view/number_of_doctors/view_models/number_of_doctors_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    BlocProvider(
      create: (context) => HomePageCubit(HomePageRepositoryImpl()),
      child: const Homepage(),
    ),
    BlocProvider(
      create: (context) => NumberOfDoctorsCubit(HomePageRepositoryImpl()),
      child: const NumberOfDoctors(),
    ),
    const Consultation(),
    const Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: pages[selectedIndex],
          ),
          Container(
            height: 64.h,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 15)
            ]),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                backgroundColor: Colors.white,
                items: [
                  BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: SvgPicture.asset(selectedIndex == 0
                        ? "assets/icons/homepage.svg"
                        : "assets/icons/homepage-stroke.svg"),
                    label: "Trang chủ",
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: SvgPicture.asset(selectedIndex == 1
                        ? "assets/icons/calendar.svg"
                        : "assets/icons/calendar-stroke.svg"),
                    label: "Đặt lịch",
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: SvgPicture.asset(selectedIndex == 2
                        ? "assets/icons/message.svg"
                        : "assets/icons/message-stroke.svg"),
                    label: "Tư vấn",
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: SvgPicture.asset(selectedIndex == 3
                        ? "assets/icons/account.svg"
                        : "assets/icons/account-stroke.svg"),
                    label: "Tài khoản",
                  ),
                ],
                onTap: onTabSelected,
                showSelectedLabels: true,
                selectedLabelStyle:
                    TextStyle(fontWeight: FontWeight.normal, fontSize: 10.sp),
                unselectedLabelStyle:
                    TextStyle(fontWeight: FontWeight.normal, fontSize: 10.sp),
                selectedItemColor: kPrimaryColor,
                unselectedItemColor: const Color(0xff000000).withOpacity(0.5),
                selectedIconTheme: const IconThemeData(color: kPrimaryColor),
                unselectedIconTheme: IconThemeData(
                    color: const Color(0xff000000).withOpacity(0.5))),
          )
        ],
      ),
    );
  }
}
