import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountActionSheet extends StatelessWidget {
  const AccountActionSheet(
      {super.key, required this.onPressed, required this.text});

  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CupertinoActionSheet(
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: onPressed,
            child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
        cancelButton: CupertinoButton.filled(
            disabledColor: const Color(0xffF52825),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Hủy",
              style: Theme.of(context).textTheme.displaySmall,
            )),
      ),
    );
  }
}
