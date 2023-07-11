import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/router/app_router.dart';
import 'package:doctor_app/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            SvgPicture.asset('assets/icons/success.svg'),
            const SizedBox(height: 58),
            const Text(
              'Mật khẩu mới đã được lưu\n Sử dụng mật khẩu mới khi đăng nhập',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: kTextColor,
              ),
            ),
            const SizedBox(height: 90),
            CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouterName.homepage);
                },
                child: Text('Đăng nhập ngay',
                    style: Theme.of(context).textTheme.displaySmall))
          ],
        ),
      )),
    );
  }
}
