import 'package:doctor_app/authentication.dart';
import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonalInforHeader extends StatefulWidget {
  const PersonalInforHeader({super.key});

  @override
  State<PersonalInforHeader> createState() => _PersonalInforHeaderState();
}

class _PersonalInforHeaderState extends State<PersonalInforHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146.h,
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.only(top: 62.h, left: 18.w, right: 18.w),
      margin: EdgeInsets.only(bottom: 54.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 64.h,
            width: 64.h,
            margin: EdgeInsets.only(right: 20.w),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.13), blurRadius: 20)
                ]),
            padding: EdgeInsets.all(2.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(75),
              child: Image.network(
                Auth().currentUser?.photoURL ?? "",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Phạm Quang',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: kTextColor)),
              Text('23 tuổi', style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
          SizedBox(width: 99.w),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRouterName.personalinforupdate);
            },
            child: SvgPicture.asset('assets/icons/fix.svg'),
          )
        ],
      ),
    );
  }
}
