import 'package:doctor_app/authentication.dart';
import 'package:doctor_app/common/notification_button.dart';
import 'package:doctor_app/components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomepageHeader extends StatelessWidget {
  const HomepageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 58.h, right: 18.w, left: 18.w, bottom: 26.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: 40.h,
              height: 40.w,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    Auth().currentUser?.photoURL ?? "",
                    fit: BoxFit.cover,
                  ))),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Xin chào,',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: kTextColor,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                      FirebaseAuth.instance.currentUser!.displayName ??
                          "Khách yêu",
                      style: Theme.of(context).textTheme.bodyMedium)
                ],
              ),
            ),
          ),
          Animate(child: NotificationButton()).scale(),
        ],
      ),
    );
  }
}
