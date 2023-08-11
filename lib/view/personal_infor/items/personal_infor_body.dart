import 'package:doctor_app/common/container_custom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonalInforBody extends StatefulWidget {
  const PersonalInforBody({super.key});

  @override
  State<PersonalInforBody> createState() => _PersonalInforBodyState();
}

class _PersonalInforBodyState extends State<PersonalInforBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 52.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 18)
            ]),
        child: Column(children: [
          ContainerCustom(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(8),
            ),
            icon: SvgPicture.asset('assets/icons/cellphone.svg'),
            text: '0374897797',
          ),
          Container(
            height: 1.h,
            width: double.infinity,
            color: const Color(0xffD8D8D8),
          ),
          ContainerCustom(
            icon: SvgPicture.asset('assets/icons/date-of-birth.svg'),
            text: '30 - 04 -1999',
          ),
          Container(
            height: 1.h,
            width: double.infinity,
            color: const Color(0xffD8D8D8),
          ),
          ContainerCustom(
            icon: SvgPicture.asset('assets/icons/gender.svg'),
            text: 'Nam',
          ),
          Container(
            height: 1.h,
            width: double.infinity,
            color: const Color(0xffD8D8D8),
          ),
          ContainerCustom(
            icon: SvgPicture.asset('assets/icons/envelop.svg'),
            text: FirebaseAuth.instance.currentUser?.email ?? "",
          ),
          Container(
            height: 1.h,
            width: double.infinity,
            color: const Color(0xffD8D8D8),
          ),
          ContainerCustom(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(8),
            ),
            icon: SvgPicture.asset('assets/icons/location.svg'),
            text: 'Trung Văn, Nam Từ Liêm, Hà Nội',
          ),
        ]),
      ),
    );
  }
}
