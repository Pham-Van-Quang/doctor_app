// ignore_for_file: deprecated_member_use
import 'package:doctor_app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/constants.dart';
import '../widgets/custom_button.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background-image.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            color: const Color(0xff000000).withOpacity(0.77),
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18, top: 178, left: 18),
            child: Column(
              children: [
                _logoImage(),
                const SizedBox(height: 86),
                const NavigatorButton()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _logoImage() {
    return SvgPicture.asset(
      'assets/icons/logo-icon.svg',
      color: Colors.white,
    );
  }
}

class NavigatorButton extends StatelessWidget {
  const NavigatorButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRouterName.signup);
            },
            style: OutlinedButton.styleFrom(
                primary: kPrimaryColor,
                side: const BorderSide(width: 1, color: kPrimaryColor),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                minimumSize: const Size(double.infinity, 50)),
            child: const Text(
              'Đăng ký',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 10),
          CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouterName.login);
              },
              child: Text('Đăng nhập',
                  style: Theme.of(context).textTheme.displaySmall)),
        ],
      ),
    );
  }
}
