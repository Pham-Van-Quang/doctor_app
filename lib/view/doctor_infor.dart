// ignore_for_file: deprecated_member_use

import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/network/remote/models/doctor_data.dart';
import 'package:doctor_app/common/back_button.dart';
import 'package:doctor_app/common/container_custom.dart';
import 'package:doctor_app/common/custom_button.dart';
import 'package:doctor_app/common/custom_line.dart';
import 'package:doctor_app/router/app_router.dart';
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
        body: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 348,
                  child: Stack(
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
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                const Color(0xffFAFAFA).withOpacity(0.01),
                                const Color(0xffFAFAFA)
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
                    Text("Bác sĩ: ${widget.doctorData?.name ?? ""}"),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/star.svg'),
                        SvgPicture.asset('assets/icons/star.svg'),
                        SvgPicture.asset('assets/icons/star.svg'),
                        SvgPicture.asset('assets/icons/star.svg'),
                        SvgPicture.asset('assets/icons/star.svg'),
                        const SizedBox(width: 15),
                        const Text(
                          '5.0 (80 đánh giá)',
                          style: TextStyle(
                              fontSize: 13,
                              color: kTextColor,
                              fontWeight: FontWeight.normal),
                        )
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
                                  child: SvgPicture.asset(
                                      'assets/icons/cellphone.svg')),
                              text: widget.doctorData?.phoneNumber ?? "",
                            ),
                            CustomLine(),
                            ContainerCustom(
                                icon: SvgPicture.asset(
                                    'assets/icons/envelop.svg'),
                                text: widget.doctorData?.email ?? ""),
                            CustomLine(),
                            ContainerCustom(
                              icon: SvgPicture.asset(
                                  'assets/icons/stethoscope.svg'),
                              text: 'Tư vấn tâm lý',
                            ),
                            CustomLine(),
                            ContainerCustom(
                              icon: SvgPicture.asset(
                                  'assets/icons/graduation-cap.svg'),
                              text:
                                  "${widget.doctorData?.year ?? ""} \n${widget.doctorData?.university ?? ""} \nChuyên ngành: ${widget.doctorData?.department ?? ""}",
                            ),
                            CustomLine(),
                            ContainerCustom(
                              icon: SvgPicture.asset('assets/icons/award.svg'),
                              borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(8)),
                              text: widget.doctorData?.award ?? "",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(18, 23, 18, 23),
          child: CustomButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRouterName.appointment,
                arguments: widget.doctorData,
              );
            },
            child: Text('Đặt lịch hẹn',
                style: Theme.of(context).textTheme.displaySmall),
          ),
        )
      ],
    ));
  }
}
