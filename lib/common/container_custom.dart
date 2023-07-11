import 'package:doctor_app/components/constants.dart';
import 'package:flutter/material.dart';

class ContainerCustom extends GestureDetector {
  ContainerCustom(
      {super.key, Function()? onTap, Widget? icon, text, borderRadius})
      : super(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: borderRadius,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 11, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 1, color: const Color(0xffD7D7D7))),
                      child: SizedBox(
                          height: 17, width: 17, child: Center(child: icon)),
                    ),
                    const SizedBox(width: 21),
                    Text(
                      text,
                      style: const TextStyle(
                          fontSize: 15,
                          color: kTextColor,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
            ));
}
