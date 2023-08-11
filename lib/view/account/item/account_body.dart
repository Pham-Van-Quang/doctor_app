// ignore_for_file: use_build_context_synchronously

import 'package:doctor_app/authentication.dart';
import 'package:doctor_app/common/account_action_sheet.dart';
import 'package:doctor_app/common/container_custom.dart';
import 'package:doctor_app/common/custom_button.dart';
import 'package:doctor_app/common/custom_line.dart';
import 'package:doctor_app/router/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountBody extends StatefulWidget {
  const AccountBody({super.key});

  @override
  State<AccountBody> createState() => _AccountBodyState();
}

class _AccountBodyState extends State<AccountBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 18.w, left: 18.w, top: 46.h),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 180.h),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1), blurRadius: 18)
                ]),
            child: Column(
              children: [
                ContainerCustom(
                  onTap: () {
                    Navigator.pushNamed(context, AppRouterName.personalinfor);
                  },
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                  icon: SvgPicture.asset('assets/icons/person.svg'),
                  text: 'Thông tin cá nhân',
                ),
                CustomLine(),
                ContainerCustom(
                  onTap: () {
                    Navigator.pushNamed(context, AppRouterName.privacyandterm);
                  },
                  icon: SvgPicture.asset('assets/icons/privacy-and-term.svg'),
                  text: 'Điều khoản & Chính sách',
                ),
                CustomLine(),
                ContainerCustom(
                  onTap: () {},
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(8),
                  ),
                  icon: SvgPicture.asset('assets/icons/password.svg'),
                  text: 'Đổi mật khẩu',
                ),
              ],
            ),
          ),
          CustomButton(
            onPressed: () {
              showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) {
                    return AccountActionSheet(
                      onPressed: () async {
                        await Auth().logout();
                        Navigator.popAndPushNamed(
                            context, AppRouterName.onboarding);
                      },
                      text: 'Đăng xuất',
                    );
                  });
            },
            child: Text('Đăng xuất',
                style: Theme.of(context).textTheme.displaySmall),
          )
        ],
      ),
    );
  }
}
