import 'package:doctor_app/view/home.dart';
import 'package:doctor_app/view/onboarding.dart';
import 'package:flutter/material.dart';

import 'authentication.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshotData) {
        if (snapshotData.hasData) {
          return const Home();
        } else {
          return const Onboarding();
        }
      },
      stream: Auth().authenStateChanges,
    );
  }
}
