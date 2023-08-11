import 'package:doctor_app/common/back_button.dart';
import 'package:doctor_app/router/app_router.dart';
import 'package:flutter/material.dart';

class ScreenHeader extends StatelessWidget {
  const ScreenHeader(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18, left: 18, top: 58, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BackButtonCustom(
            onTap: () {
              Navigator.popAndPushNamed(
                context,
                AppRouterName.homepage,
              );
            },
          ),
          Text(
            'Danh sách bác sĩ',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(
            height: 40,
            width: 40,
          )
        ],
      ),
    );
  }
}
