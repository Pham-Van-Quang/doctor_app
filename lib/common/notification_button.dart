import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationButton extends GestureDetector {
  NotificationButton({super.key, Function()? onTap})
      : super(
          onTap: onTap,
          child: Container(
            height: 40.h,
            width: 40.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff004080).withOpacity(0.1),
                    blurRadius: 20,
                  )
                ]),
            child: SizedBox(
                width: 24.w,
                child: Center(
                    child: SvgPicture.asset('assets/icons/notification.svg'))),
          ),
        );
}
