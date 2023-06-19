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
        itemBuilder: (context, index) => Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.only(top: 10, left: 12, bottom: 12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff004080).withOpacity(0.04),
                      blurRadius: 20,
                    )
                  ]),
              // child: Row(
              //   children: [
              //     Container(
              //       margin: const EdgeInsets.only(right: 10),
              //       child: CircleAvatar(
              //         radius: 45,
              //         backgroundImage:
              //             NetworkImage(widget.doctorList[index].imageUrl ?? ""),
              //       ),
              //     ),
              //     Column(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           "Bác sĩ: ${widget.doctorList[index].name ?? ""}",
              //           style: const TextStyle(
              //               fontSize: 15, fontWeight: FontWeight.w700),
              //         ),
              //         Text(
              //             "Chuyên khoa: ${widget.doctorList[index].speciality ?? ""}",
              //             style: const TextStyle(
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.normal,
              //                 color: kTextColor)),
              //         SizedBox(
              //           height: 12,
              //           width: 12,
              //           child: SvgPicture.asset('assets/icons/star.svg'),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
            ));
  }
}
