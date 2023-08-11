import 'package:doctor_app/common/back_button.dart';
import 'package:flutter/material.dart';

class PrivacyAndTermHeader extends StatelessWidget {
  const PrivacyAndTermHeader(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackButtonCustom(
          onTap: () {
            Navigator.pop(context);
          },
        ),
        Text(
          'Chính sách',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(
          height: 40,
          width: 40,
        )
      ],
    );
  }
}
