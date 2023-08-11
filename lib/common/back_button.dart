// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackButtonCustom extends GestureDetector {
  BackButtonCustom({super.key, Function()? onTap})
      : super(
          onTap: onTap,
          child: Container(
            height: 40.h,
            width: 40.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.transparent,
                border: Border.all(width: 1.w, color: const Color(0xffDCDCDC))),
            child: Image.asset('assets/images/back-arrow.png'),
            alignment: Alignment.center,
          ),
        );
}
