import 'package:doctor_app/screens/onboarding.dart';
import 'package:flutter/material.dart';

import 'authentication.dart';
import 'screens/home_page.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshotData) {
        if (snapshotData.hasData) {
          return const Homepage();
        } else {
          return const Onboarding();
        }
      },
      stream: Auth().authenStateChanges,
    );
  }
}
