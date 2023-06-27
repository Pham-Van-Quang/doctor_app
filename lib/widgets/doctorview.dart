import 'package:doctor_app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/constants.dart';
import '../models/doctor_data.dart';

class DoctorView extends StatefulWidget {
  const DoctorView({
    super.key,
    required this.doctorList,
    required this.customItemCount,
  });

  final List<DoctorData> doctorList;
  final int customItemCount;

  @override
  State<DoctorView> createState() => _DoctorViewState();
}

class _DoctorViewState extends State<DoctorView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.customItemCount,
        itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRouterName.doctorinfor,
                    arguments: widget.doctorList[index]);
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.only(top: 10, left: 14, bottom: 12),
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
                    if (widget.doctorList.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        height: 90,
                        width: 90,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(75),
                          child: Image.network(
                            widget.doctorList[index].imageUrl ?? "",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bác sĩ: ${widget.doctorList[index].name ?? ""}",
                            style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(height: 13),
                        Text(
                            "Chuyên khoa: ${widget.doctorList[index].speciality ?? ""}",
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
            ));
  }
}
