import 'package:doctor_app/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountHeader extends StatefulWidget {
  const AccountHeader({super.key});

  @override
  State<AccountHeader> createState() => _AccountHeaderState();
}

class _AccountHeaderState extends State<AccountHeader> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 236.h,
        ),
        Positioned(
          top: 0,
          child: Expanded(
            child: SizedBox(
              height: 182.h,
              width: double.infinity,
              child: Image.asset('assets/images/cover-image.jpg',
                  fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(
          left: 18,
          bottom: 0,
          child: Container(
            height: 108.h,
            width: 108.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.13), blurRadius: 20)
                ]),
            padding: EdgeInsets.all(4.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(75),
              child: Image.network(
                Auth().currentUser?.photoURL ?? "",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          right: 120,
          child: Text(
              FirebaseAuth.instance.currentUser!.displayName ?? "Khách yêu",
              style: Theme.of(context).textTheme.displayMedium),
        )
      ],
    );
  }
}
