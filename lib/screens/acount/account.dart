import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/router/app_router.dart';
import 'package:doctor_app/screens/acount/item/account_action_sheet.dart';
import 'package:doctor_app/widgets/bottom_app_bar.dart';
import 'package:doctor_app/widgets/container_custom.dart';
import 'package:doctor_app/widgets/custom_button.dart';
import 'package:doctor_app/widgets/custom_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 236,
              ),
              Positioned(
                top: 0,
                child: Expanded(
                  child: SizedBox(
                    height: 182,
                    width: double.infinity,
                    child: Image.asset('assets/images/cover-image.jpg',
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                left: 18,
                bottom: 0,
                child: Container(
                  height: 108,
                  width: 108,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.13),
                            blurRadius: 20)
                      ]),
                  padding: const EdgeInsets.all(4),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
                ),
              ),
              const Positioned(
                bottom: 16,
                right: 110,
                child: Text('Phạm Quang',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: kTextColor)),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18, left: 18, top: 46),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
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
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRouterName.personalinfor);
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
                          Navigator.pushNamed(
                              context, AppRouterName.privacyandterm);
                        },
                        icon: SvgPicture.asset(
                            'assets/icons/privacy-and-term.svg'),
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
                const SizedBox(height: 200),
                CustomButton(
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) {
                          return AccountActionSheet();
                        });
                  },
                  child: Text('Đăng xuất',
                      style: Theme.of(context).textTheme.displaySmall),
                )
              ],
            ),
          ),
          const BottomBar()
        ],
      ),
    );
  }
}
