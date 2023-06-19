// ignore_for_file: deprecated_member_use

import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/router/app_router.dart';
import 'package:doctor_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/back_button.dart';
import '../widgets/text_field.dart';

class ForgottenPassword extends StatefulWidget {
  const ForgottenPassword({super.key});

  @override
  State<ForgottenPassword> createState() => _ForgottenPasswordState();
}

class _ForgottenPasswordState extends State<ForgottenPassword> {
  TextEditingController emailAddress = TextEditingController();
  String? emailAddressValue;
  bool isEmailFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 18, left: 18, top: 72),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonCustom(onTap: () {
              Navigator.popUntil(
                  context, ModalRoute.withName(AppRouterName.login));
            }),
            const SizedBox(height: 24),
            Text(
              'Quên mật khẩu',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 16),
            const Text('Nhập địa chỉ để cập nhật mật khẩu',
                style: TextStyle(fontSize: 16, color: kTextColor)),
            const SizedBox(height: 122),
            TextFieldCustom(
              controller: emailAddress,
              onTap: () => setState(() {
                isEmailFocused = true;
              }),
              onChanged: (value) => setState(() {
                isEmailFocused = true;
              }),
              hintText: 'Email',
              child: SvgPicture.asset('assets/icons/email.svg',
                  color: isEmailFocused ? kTextColor : null),
            ),
            const SizedBox(height: 26),
            CustomButton(
                onPressed: () {},
                child: Text('Gửi',
                    style: Theme.of(context).textTheme.displaySmall))
          ],
        ),
      ),
    );
  }
}
