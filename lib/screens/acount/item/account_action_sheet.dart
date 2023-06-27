import 'package:doctor_app/router/app_router.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountActionSheet extends StatelessWidget {
  const AccountActionSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CupertinoActionSheet(
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.popAndPushNamed(
                context,
                AppRouterName.onboarding,
              );
            },
            child: Text('Đăng xuất',
                style: Theme.of(context).textTheme.bodyMedium),
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
