import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessfulAppointment extends StatefulWidget {
  const SuccessfulAppointment({super.key});

  @override
  State<SuccessfulAppointment> createState() => _SuccessfulAppointmentState();
}

class _SuccessfulAppointmentState extends State<SuccessfulAppointment> {
  late String doctorName;
  late String speciality;
  late DateTime appointmentTime;
  late String appointmentDate;
  late String appointmentHour;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final Map<String, dynamic>? arguments =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
      if (arguments != null) {
        setState(() {
          doctorName = arguments['doctorName'];
          speciality = arguments['speciality'];
          appointmentTime = arguments['appointmentTime'];
          appointmentDate = '${appointmentTime.day}/${appointmentTime.month}';
          appointmentHour =
              '${appointmentTime.hour} : ${appointmentTime.minute}';
        });
      }
    });

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.popAndPushNamed(
        context,
        AppRouterName.homepage,
        arguments: {
          'doctorName': doctorName,
          'speciality': speciality,
          'appointmentDate': appointmentDate,
          'appointmentHour': appointmentHour,
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Animate(
            child: SizedBox(
                height: 160,
                child: Center(
                    child: SvgPicture.asset('assets/icons/success.svg'))),
          ).scale(),
          const SizedBox(height: 72),
          Text('Thành công!', style: Theme.of(context).textTheme.displayMedium),
          const Text(
            'Màn hình tự động quay về Trang chủ trong 3s !',
            style: TextStyle(
                fontSize: 13, color: kTextColor, fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
