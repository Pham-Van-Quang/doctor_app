import 'package:doctor_app/view/account/item/account_body.dart';
import 'package:doctor_app/view/account/item/account_header.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          AccountHeader(),
          AccountBody(),
        ],
      ),
    );
  }
}
