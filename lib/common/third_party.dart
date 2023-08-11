import 'package:flutter/material.dart';

class ThirdParty extends Row {
  ThirdParty({super.key, Function()? onTap, Function()? onPressed})
      : super(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: onPressed,
                icon: Image.asset(
                  'assets/images/facebook.png',
                )),
            const SizedBox(width: 102),
            IconButton(
                onPressed: onPressed,
                icon: Image.asset(
                  'assets/images/google.png',
                )),
          ],
        );
}
