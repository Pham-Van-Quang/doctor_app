// ignore_for_file: deprecated_member_use

import 'package:doctor_app/models/doctor_data.dart';
import 'package:doctor_app/widgets/back_button.dart';
import 'package:doctor_app/widgets/container_custom.dart';
import 'package:doctor_app/widgets/custom_button.dart';
import 'package:doctor_app/widgets/custom_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorInformation extends StatefulWidget {
  const DoctorInformation({super.key, required this.doctorData});
  final DoctorData? doctorData;
  @override
  State<DoctorInformation> createState() => _DoctorInformationState();
}

class _DoctorInformationState extends State<DoctorInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.red,
            height: 348,
            // width: double.infinity,
            child: // child:
                Stack(
              children: [
                SizedBox(
                  height: 348,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    child: Image.network(
                      widget.doctorData?.imageUrl ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    height: 94,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          // Color(0xffFAFAFA).withOpacity(0.01),
                          // Color(0xffFAFAFA)
                          Colors.black,
                          Colors.black54
                        ])),
                  ),
                ),
                Positioned(
                    left: 18,
                    top: 56,
                    child: BackButtonCustom(
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ))
              ],
            ),
          ),
          const SizedBox(height: 38),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Bác sĩ Lý Lệ Thu'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/star.svg'),
                  SvgPicture.asset('assets/icons/star.svg'),
                  SvgPicture.asset('assets/icons/star.svg'),
                  SvgPicture.asset('assets/icons/star.svg'),
                  SvgPicture.asset('assets/icons/star.svg'),
                  const SizedBox(width: 15),
                  const Text('5.0 (80 đánh giá)')
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 40, 18, 12),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 18)
                      ]),
                  child: Column(
                    children: [
                      ContainerCustom(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(8)),
                        icon: SizedBox(
                            height: 17,
                            width: 17,
                            child:
                                SvgPicture.asset('assets/icons/cellphone.svg')),
                        text: '0911 222 333',
                      ),
                      CustomLine(),
                      ContainerCustom(
                        icon: SvgPicture.asset('assets/icons/envelop.svg'),
                        text: 'lylethu123@gmail.com',
                      ),
                      CustomLine(),
                      ContainerCustom(
                        icon: SvgPicture.asset('assets/icons/stethoscope.svg'),
                        text: 'Tư vấn tâm lý',
                      ),
                      CustomLine(),
                      ContainerCustom(
                        icon:
                            SvgPicture.asset('assets/icons/graduation-cap.svg'),
                        text:
                            '2008 - 2014 \nTư vấn tâm lý \nChuyên ngành: Thần kinh ',
                      ),
                      CustomLine(),
                      ContainerCustom(
                        icon: SvgPicture.asset('assets/icons/award.svg'),
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(8)),
                        text:
                            'Giải thưởng Alexandre Yersin \nGiải thưởng Phạm Ngọc Thạch',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                CustomButton(
                  child: Text('Đặt lịch hẹn',
                      style: Theme.of(context).textTheme.displaySmall),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
