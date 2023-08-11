import 'package:doctor_app/components/constants.dart';
import 'package:flutter/material.dart';

class PrivacyContent extends StatefulWidget {
  const PrivacyContent({super.key});

  @override
  State<PrivacyContent> createState() => _PrivacyContentState();
}

class _PrivacyContentState extends State<PrivacyContent> {
  String dummyText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley ";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 22, bottom: 24),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 18,
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        dummyText,
        style: const TextStyle(
            fontSize: 15, color: kTextColor, fontWeight: FontWeight.normal),
      ),
    );
  }
}
