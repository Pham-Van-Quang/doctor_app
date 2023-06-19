// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class BackButtonCustom extends GestureDetector {
  BackButtonCustom({super.key, Function()? onTap})
      : super(
          onTap: onTap,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.transparent,
                border: Border.all(width: 1, color: const Color(0xffDCDCDC))),
            child: Image.asset('assets/images/back-arrow.png'),
            alignment: Alignment.center,
          ),
        );
}
