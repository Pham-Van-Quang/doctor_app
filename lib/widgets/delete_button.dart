import 'package:flutter/material.dart';

class DeleteButton extends Container {
  DeleteButton({super.key, Function()? onTap, Widget? child})
      : super(
            height: 40,
            width: 40,
            child: child,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xff004080).withOpacity(0.1),
                      blurRadius: 20)
                ]));
}
