// ignore_for_file: deprecated_member_use

import 'package:doctor_app/router/app_router.dart';
import 'package:doctor_app/widgets/back_button.dart';
import 'package:doctor_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/constants.dart';
import '../widgets/text_field.dart';

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({super.key});

  @override
  State<PasswordRecovery> createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  TextEditingController newPassword = TextEditingController();
  TextEditingController enterNewPassword = TextEditingController();
  String? newPasswordValue;
  String? enterNewPasswordValue;
  bool isPasswordFocused = false;
  bool isShowedPassWord = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(right: 18, left: 18, top: 72),
        child: Column(
          children: [
            BackButtonCustom(onTap: () {
              Navigator.popUntil(context,
                  ModalRoute.withName(AppRouterName.forgottenpassword));
            }),
            const SizedBox(height: 24),
            Text('Khôi phục mật khẩu',
                style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 22),
            TextFieldCustom(
              controller: newPassword,
              onTap: () => setState(() {
                isPasswordFocused = true;
              }),
              onSubmitted: (value) => setState(() {
                isPasswordFocused = false;
              }),
              obscureText: !isShowedPassWord,
              hintText: 'Mật khẩu',
              child: SvgPicture.asset('assets/icons/lock.svg',
                  color: isPasswordFocused ? kTextColor : null),
            ),
            const SizedBox(height: 16),
            TextFieldCustom(
              controller: newPassword,
              onTap: () => setState(() {
                isPasswordFocused = true;
              }),
              onSubmitted: (value) => setState(() {
                isPasswordFocused = false;
              }),
              obscureText: !isShowedPassWord,
              hintText: 'Mật khẩu',
              child: SvgPicture.asset('assets/icons/lock.svg',
                  color: isPasswordFocused ? kTextColor : null),
              suffixIcon: InkWell(
                onTap: () => setState(() {
                  isShowedPassWord = !isShowedPassWord;
                }),
                child: SizedBox(
                  width: 22,
                  child: Center(
                    child: SvgPicture.asset(
                      isShowedPassWord
                          ? 'assets/icons/open-eye.svg'
                          : 'assets/icons/hidden-eye.svg',
                      color: isShowedPassWord ? kTextColor : null,
                    ),
                  ),
                ),
              ),
            ),
            CustomButton(
                onPressed: () {},
                child: Text(
                  'Thay đổi',
                  style: Theme.of(context).textTheme.displaySmall,
                ))
          ],
        ),
      )),
    );
  }
}
