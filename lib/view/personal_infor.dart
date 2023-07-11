import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/router/app_router.dart';
import 'package:doctor_app/view/authentication.dart';
import 'package:doctor_app/common/container_custom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PersonalInfor extends StatefulWidget {
  const PersonalInfor({super.key});

  @override
  State<PersonalInfor> createState() => _PersonalInforState();
}

class _PersonalInforState extends State<PersonalInfor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 146,
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.only(top: 62, left: 18, right: 18),
            margin: const EdgeInsets.only(bottom: 54),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.13),
                            blurRadius: 20)
                      ]),
                  padding: const EdgeInsets.all(2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(75),
                    child: Image.network(
                      Auth().currentUser?.photoURL ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Phạm Quang',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: kTextColor)),
                    Text('23 tuổi',
                        style: Theme.of(context).textTheme.bodyMedium)
                  ],
                ),
                const SizedBox(width: 100),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, AppRouterName.personalinforupdate);
                  },
                  child: SvgPicture.asset('assets/icons/fix.svg'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 52),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1), blurRadius: 18)
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
                  height: 1,
                  width: double.infinity,
                  color: const Color(0xffD8D8D8),
                ),
                ContainerCustom(
                  icon: SvgPicture.asset('assets/icons/date-of-birth.svg'),
                  text: '30 - 04 -1999',
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: const Color(0xffD8D8D8),
                ),
                ContainerCustom(
                  icon: SvgPicture.asset('assets/icons/gender.svg'),
                  text: 'Nam',
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: const Color(0xffD8D8D8),
                ),
                ContainerCustom(
                  icon: SvgPicture.asset('assets/icons/envelop.svg'),
                  text: FirebaseAuth.instance.currentUser?.email ?? "",
                ),
                Container(
                  height: 1,
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
          )
        ],
      ),
    );
  }
}
