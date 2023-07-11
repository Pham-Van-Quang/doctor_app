// ignore_for_file: deprecated_member_use

import 'package:doctor_app/router/app_router.dart';
import 'package:doctor_app/view/splash_screen/view/splash_screen.dart';
import 'package:flutter/material.dart';

import 'components/constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/splashscreen",
      onGenerateRoute: AppRouter.onGeneratedRoute,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffFAFAFA),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'SVN-Avo',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontSize: 22,
              fontFamily: 'SVN-Avo',
              color: kTextColor,
              fontWeight: FontWeight.w700),
          displayMedium: TextStyle(
              fontSize: 20,
              fontFamily: 'SVN-Avo',
              color: kTextColor,
              fontWeight: FontWeight.w700),
          displaySmall: TextStyle(
              fontSize: 16,
              fontFamily: 'SVN-Avo',
              color: Colors.white,
              fontWeight: FontWeight.w700),
          bodySmall:
              TextStyle(fontSize: 13, fontFamily: 'SVN-Avo', color: kTextColor),
          bodyMedium: TextStyle(
              fontSize: 16,
              fontFamily: 'SVN-Avo',
              fontWeight: FontWeight.w700,
              color: kTextColor),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
