import 'package:doctor_app/common/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentHeader extends StatefulWidget {
  const AppointmentHeader({super.key});

  @override
  State<AppointmentHeader> createState() => _AppointmentHeaderState();
}

class _AppointmentHeaderState extends State<AppointmentHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackButtonCustom(
          onTap: () => Navigator.pop(context),
        ),
        Text('Đặt lịch hẹn', style: Theme.of(context).textTheme.displayMedium),
        SizedBox(
          height: 40.h,
          width: 40.h,
        )
      ],
    );
  }
}
