import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/constants.dart';

class TextFieldCustom extends SizedBox {
  TextFieldCustom(
      {super.key,
      Function()? onTap,
      Widget? child,
      controller,
      bool? obscureText,
      onSubmitted,
      onChanged,
      hintText,
      suffixIcon})
      : super(
          height: 50.h,
          width: double.infinity,
          child: TextField(
            controller: controller,
            obscureText: obscureText ?? false,
            onSubmitted: onSubmitted,
            onTap: onTap,
            onChanged: onChanged,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 14.sp, color: kTextColorButton),
                contentPadding: EdgeInsets.symmetric(vertical: 15.w),
                prefixIcon: SizedBox(
                  width: 22.w,
                  child: Center(child: child),
                ),
                suffixIcon: suffixIcon,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        BorderSide(width: 1.w, color: kTextColorButton)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(width: 1.w, color: kPrimaryColor))),
          ),
        );
}
