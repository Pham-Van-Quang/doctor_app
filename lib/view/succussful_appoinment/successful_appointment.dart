import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/router/app_router.dart';
import 'package:doctor_app/view/succussful_appoinment/view_model/successful_appointment_cubit.dart';
import 'package:doctor_app/view/succussful_appoinment/view_model/successful_appointment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessfulAppointment extends StatefulWidget {
  const SuccessfulAppointment({super.key});

  @override
  State<SuccessfulAppointment> createState() => _SuccessfulAppointmentState();
}

class _SuccessfulAppointmentState extends State<SuccessfulAppointment> {
  late final _successfulAppointmentCubit =
      context.read<SuccessfulAppointmentCubit>();

  @override
  void initState() {
    super.initState();
    _successfulAppointmentCubit;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final Map<String, dynamic>? arguments =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
      if (arguments != null) {
        _successfulAppointmentCubit.loadData(arguments);
      }
    });

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.popAndPushNamed(
        context,
        AppRouterName.homepage,
        arguments: {
          'doctorName': _successfulAppointmentCubit.state.doctorName,
          'speciality': _successfulAppointmentCubit.state.speciality,
          'appointmentDate': _successfulAppointmentCubit.state.appointmentDate,
          'appointmentHour': _successfulAppointmentCubit.state.appointmentHour,
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuccessfulAppointmentCubit, SuccessfulAppointmentState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Animate(
                child: SizedBox(
                    height: 160.h,
                    child: Center(
                        child: SvgPicture.asset('assets/icons/success.svg'))),
              ).scale(),
              SizedBox(height: 72.h),
              Text('Thành công!',
                  style: Theme.of(context).textTheme.displayMedium),
              Text(
                'Màn hình tự động quay về Trang chủ trong 3s !',
                style: TextStyle(
                    fontSize: 13.sp,
                    color: kTextColor,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }
}
