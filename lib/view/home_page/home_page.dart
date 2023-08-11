// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/network/remote/models/doctor_data.dart';
import 'package:doctor_app/router/app_router.dart';
import 'package:doctor_app/view/home_page/items/homepage_header.dart';
import 'package:doctor_app/view/home_page/view_model/home_page_cubit.dart';
import 'package:doctor_app/view/home_page/view_model/home_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  SharedPreferences? prefs;
  String? doctorName;
  String? speciality;
  String? appointmentDate;
  String? appointmentHour;
  late final _homePageCubit = context.read<HomePageCubit>();

  @override
  void initState() {
    initSharedPref();
    _homePageCubit;
    _homePageCubit.getData();
    super.initState();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (arguments != null) {
      doctorName = arguments['doctorName'];
      speciality = arguments['speciality'];
      appointmentDate = arguments['appointmentDate'];
      appointmentHour = arguments['appointmentHour'];
    } else {
      doctorName = prefs?.getString('doctorName');
      speciality = prefs?.getString('speciality');
      appointmentDate = prefs?.getString('appointmentDate');
      appointmentHour = prefs?.getString('appointmentHour');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        doctorList = state.doctorList;
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                const HomepageHeader(),
                _homepageBody(context, state),
              ],
            ),
          ),
        );
      },
    );
  }

  Expanded _homepageBody(BuildContext context, HomePageState state) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: 18.w, left: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 22.h),
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
              SizedBox(height: 22.h),
              if (doctorName != null &&
                  speciality != null &&
                  appointmentDate != null &&
                  appointmentHour != null &&
                  state.isItemVisible)
                Slidable(
                  endActionPane: ActionPane(
                      extentRatio: 0.2,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) async {
                            await prefs?.remove('doctorName');
                            await prefs?.remove('speciality');
                            await prefs?.remove('appointmentDate');
                            await prefs?.remove('appointmentHour');
                            _homePageCubit.updateIsItemVisible();
                          },
                          backgroundColor: const Color(0xffF52825),
                          borderRadius: BorderRadius.circular(8),
                          foregroundColor: Colors.white,
                          label: 'Xóa',
                        ),
                      ]),
                  child: Container(
                    height: 94.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff004080).withOpacity(0.04),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: double.infinity,
                          width: 72.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: kPrimaryColor,
                          ),
                          child: Text(
                            appointmentDate!,
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Thời gian: $appointmentHour',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: kTextColor,
                              ),
                            ),
                            Text(
                              'Bác sĩ: $doctorName',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal,
                                color: kTextColor,
                              ),
                            ),
                            Text(
                              'Chuyên môn: $speciality',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal,
                                color: kTextColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 32.w),
                        Center(
                            child: SizedBox(
                          height: 26.h,
                          width: 20.w,
                          child: GestureDetector(
                            onTap: () async {
                              _homePageCubit.isSaved();
                              await prefs?.setString(
                                  'doctorName', doctorName ?? '');
                              await prefs?.setString(
                                  'speciality', speciality ?? '');
                              await prefs?.setString(
                                  'appointmentDate', appointmentDate ?? '');
                              await prefs?.setString(
                                  'appointmentHour', appointmentHour ?? '');
                            },
                            child: SvgPicture.asset(
                              'assets/icons/save.svg',
                              color: state.isSaved
                                  ? kPrimaryColor
                                  : kSecondaryColor,
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                )
              else
                Container(
                  height: 50.h,
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xff004080).withOpacity(0.04),
                            blurRadius: 20)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Đặt lịch ngay',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRouterName.numberofdoctors);
                        },
                        child: SizedBox(
                            height: 22.h,
                            width: 22.h,
                            child: Center(
                                child: SvgPicture.asset(
                                    'assets/icons/add-appointment.svg'))),
                      )
                    ],
                  ),
                ),
              SizedBox(height: 22.h),
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
                    child: Text(
                      'Xem thêm',
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.normal,
                          color: kTextColor,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              SizedBox(height: 26.h),
              if (state.doctorList.isNotEmpty)
                DoctorView(customItemCount: 3, doctorList: state.doctorList)
            ],
          ),
        ),
      ),
    );
  }
}
