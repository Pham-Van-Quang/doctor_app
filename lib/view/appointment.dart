// ignore_for_file: unused_local_variable

import 'package:doctor_app/common/account_action_sheet.dart';
import 'package:doctor_app/common/back_button.dart';
import 'package:doctor_app/common/container_custom.dart';
import 'package:doctor_app/common/custom_button.dart';
import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/network/remote/models/doctor_data.dart';
import 'package:doctor_app/router/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Appointment extends StatefulWidget {
  const Appointment({Key? key, required this.doctorData}) : super(key: key);

  final DoctorData? doctorData;

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  DateTime dateTime = DateTime(2023, 07, 01, 5, 30);

  String doctorName = "";
  String speciality = "";
  DateTime appointmentTime = DateTime(2023, 07, 01, 5, 30);

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1950),
      lastDate: DateTime(2100));

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));

  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18, left: 18, top: 58, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackButtonCustom(
                        onTap: () => Navigator.pop(context),
                      ),
                      Text('Đặt lịch hẹn',
                          style: Theme.of(context).textTheme.displayMedium),
                      const SizedBox(
                        height: 40,
                        width: 40,
                      )
                    ],
                  ),
                  const SizedBox(height: 26),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 12),
                    padding:
                        const EdgeInsets.only(top: 10, left: 14, bottom: 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff004080).withOpacity(0.04),
                            blurRadius: 20,
                          )
                        ]),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 90,
                          width: 90,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(75),
                            child: Image.network(
                              widget.doctorData?.imageUrl ?? "",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Bác sĩ: ${widget.doctorData?.name ?? ""}",
                                style: Theme.of(context).textTheme.bodyMedium),
                            const SizedBox(height: 13),
                            Text(
                                "Chuyên khoa: ${widget.doctorData?.speciality ?? ""}",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: kTextColor)),
                            const SizedBox(height: 13),
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/star.svg'),
                                SvgPicture.asset('assets/icons/star.svg'),
                                SvgPicture.asset('assets/icons/star.svg'),
                                SvgPicture.asset('assets/icons/star.svg'),
                                SvgPicture.asset('assets/icons/star.svg'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Chọn ngày',
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 13),
                  ContainerCustom(
                    onTap: () async {
                      final date = await pickDate();
                      if (date == null) return;
                      final newDateTime = DateTime(date.year, date.month,
                          date.day, dateTime.hour, dateTime.minute);
                      setState(() {
                        dateTime = newDateTime;
                      });
                    },
                    borderRadius: BorderRadius.circular(8),
                    text:
                        '${dateTime.year}/ ${dateTime.month}/ ${dateTime.day}',
                    icon: SvgPicture.asset('assets/icons/pick-date.svg'),
                  ),
                  const SizedBox(height: 16),
                  Text('Chọn giờ',
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 13),
                  ContainerCustom(
                    onTap: () async {
                      final time = await pickTime();
                      if (time == null) return;
                      final newDateTime = DateTime(dateTime.year,
                          dateTime.month, dateTime.day, time.hour, time.minute);
                      setState(() {
                        dateTime = newDateTime;
                      });
                    },
                    borderRadius: BorderRadius.circular(8),
                    text: '$hours : $minutes',
                    icon: SvgPicture.asset('assets/icons/clock.svg'),
                  )
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(18, 23, 18, 23),
            child: CustomButton(
              onPressed: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) {
                      return AccountActionSheet(
                          onPressed: () {
                            setState(() {
                              doctorName = widget.doctorData?.name ?? "";
                              speciality = widget.doctorData?.speciality ?? "";
                            });
                            Navigator.pushNamed(
                                context, AppRouterName.successfulappointment,
                                arguments: {
                                  'doctorName': doctorName,
                                  'speciality': speciality,
                                  'appointmentTime': appointmentTime,
                                });
                          },
                          text: 'Đồng ý');
                    });
              },
              child: Text('Đặt lịch ngay',
                  style: Theme.of(context).textTheme.displaySmall),
            ),
          )
        ],
      ),
    );
  }
}
