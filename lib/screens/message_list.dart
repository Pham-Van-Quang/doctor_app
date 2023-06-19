// ignore_for_file: deprecated_member_use

import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/widgets/back_button.dart';
import 'package:doctor_app/widgets/bottom_app_bar.dart';
import 'package:doctor_app/widgets/delete_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MessageList extends StatefulWidget {
  const MessageList({super.key});

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  TextEditingController search = TextEditingController();
  bool isSearchFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 58, right: 18, left: 18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButtonCustom(
                  onTap: () {},
                ),
                Text("Tin nhắn",
                    style: Theme.of(context).textTheme.displayMedium),
                DeleteButton(
                  child: SizedBox(
                      height: 25,
                      child: Center(
                          child: SvgPicture.asset('assets/icons/bin.svg'))),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: TextField(
                controller: search,
                onTap: () => setState(() {
                  isSearchFocused = true;
                }),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffDCDCDC).withOpacity(0.54),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 21, right: 26),
                      child: SizedBox(
                        height: 28,
                        width: 28,
                        child: SvgPicture.asset(
                          'assets/icons/search.svg',
                          color: isSearchFocused ? kTextColor : null,
                        ),
                      ),
                    ),
                    hintText: 'Bác sĩ, cuộc trò chuyện',
                    hintStyle: const TextStyle(fontSize: 14, color: kTextColor),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none)),
              ),
            )
          ],
        ),
      ),
      const BottomBar(),
    ]));
  }
}
