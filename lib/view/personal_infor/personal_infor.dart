import 'package:doctor_app/view/personal_infor/items/personal_infor_body.dart';
import 'package:doctor_app/view/personal_infor/items/personal_infor_header.dart';
import 'package:flutter/material.dart';

class PersonalInfor extends StatefulWidget {
  const PersonalInfor({super.key});

  @override
  State<PersonalInfor> createState() => _PersonalInforState();
}

class _PersonalInforState extends State<PersonalInfor> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          PersonalInforHeader(),
          PersonalInforBody(),
        ],
      ),
    );
  }
}
