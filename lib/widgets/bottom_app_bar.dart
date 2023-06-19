import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 15)
      ]),
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
                Navigator.pushNamed(context, AppRouterName.homepage);
              },
              child: SvgPicture.asset(selectedIndex == 0
                  ? "assets/icons/homepage.svg"
                  : "assets/icons/homepage-stroke.svg"),
            ),
            label: "Trang chủ",
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
                Navigator.pushNamed(context, AppRouterName.privacyandterm);
              },
              child: SvgPicture.asset(selectedIndex == 1
                  ? "assets/icons/calendar.svg"
                  : "assets/icons/calendar-stroke.svg"),
            ),
            label: "Đặt lịch",
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
                Navigator.pushNamed(context, AppRouterName.messagelist);
              },
              child: SvgPicture.asset(selectedIndex == 2
                  ? "assets/icons/message.svg"
                  : "assets/icons/message-stroke.svg"),
            ),
            label: "Tin nhắn",
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 3;
                });
              },
              child: SvgPicture.asset(selectedIndex == 3
                  ? "assets/icons/account.svg"
                  : "assets/icons/account-stroke.svg"),
            ),
            label: "Tài khoản",
          ),
        ],
        onTap: onTabSelected,
        showSelectedLabels: true,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
        // unselectedLabelStyle:
        //     TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
        selectedItemColor: kPrimaryColor,
        // unselectedItemColor: Color(0xff000000).withOpacity(0.5),
        // selectedIconTheme: IconThemeData(color: kPrimaryColor),
        // unselectedIconTheme:
        //     IconThemeData(color: Color(0xff000000).withOpacity(0.5)),
      ),
    );
  }
}
