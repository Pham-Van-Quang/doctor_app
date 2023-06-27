import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = true;
  @override
  void initState() {
    // requestPermission();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, AppRouterName.widgettree);
    });
    super.initState();
  }

  void requestPermission() async {
    // ignore: unused_local_variable
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    // if (await Permission.storage.request().isGranted) {
    //   Future.delayed(const Duration(seconds: 2), () {
    //     Navigator.pushNamed(context, "/widgettree");
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.only(top: 336, bottom: 80),
              alignment: Alignment.center,
              child: Image.asset('assets/images/logo.png')),
          if (isLoading)
            const CircularProgressIndicator(
              backgroundColor: kPrimaryColor,
            )
        ],
      ),
    );
  }
}
