import 'package:doctor_app/network/remote/models/doctor_data.dart';
import 'package:doctor_app/common/doctorview.dart';
import 'package:doctor_app/view/number_of_doctors/items/screen_header.dart';
import 'package:doctor_app/view/number_of_doctors/view_models/number_of_doctors_cubit.dart';
import 'package:doctor_app/view/number_of_doctors/view_models/number_of_doctors_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberOfDoctors extends StatefulWidget {
  const NumberOfDoctors({super.key});

  @override
  State<NumberOfDoctors> createState() => _NumberOfDoctorsState();
}

class _NumberOfDoctorsState extends State<NumberOfDoctors> {
  List<DoctorData> doctorList = [];
  late final _numberOfDoctorsCubit = context.read<NumberOfDoctorsCubit>();

  @override
  void initState() {
    _numberOfDoctorsCubit.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NumberOfDoctorsCubit, NumberOfDoctorsState>(
      builder: (context, state) {
        doctorList = state.doctorList;
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                ScreenHeader(context),
                screenBody(state),
              ],
            ),
          ),
        );
      },
    );
  }

  Expanded screenBody(NumberOfDoctorsState state) {
    return Expanded(
      child: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 0),
        child: DoctorView(
            doctorList: state.doctorList, customItemCount: doctorList.length),
      )),
    );
  }
}
