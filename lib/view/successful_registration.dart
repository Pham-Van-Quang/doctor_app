import 'package:doctor_app/router/app_router.dart';
import 'package:doctor_app/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuccessfulRegistration extends StatefulWidget {
  const SuccessfulRegistration({super.key});

  @override
  State<SuccessfulRegistration> createState() => _SuccessfulRegistrationState();
}

class _SuccessfulRegistrationState extends State<SuccessfulRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18, top: 156),
        child: Column(
          children: [
            SvgPicture.asset('assets/icons/success.svg'),
            const SizedBox(height: 66),
            Text('Chúc mừng\nĐăng ký thành công!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 130),
            CustomButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRouterName.login),
              child: Text('Đăng nhập ngay',
                  style: Theme.of(context).textTheme.displaySmall),
            )
          ],
        ),
      ),
    );
  }
}
