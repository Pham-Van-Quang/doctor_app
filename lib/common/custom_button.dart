import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/constants.dart';

class CustomButton extends ElevatedButton {
  CustomButton({super.key, Function()? onPressed, Widget? child})
      : super(
          onPressed: onPressed,
          child: child,
          style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              minimumSize: Size(double.infinity, 50.h)),
        );
}
