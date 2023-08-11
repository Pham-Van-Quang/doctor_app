import 'package:doctor_app/common/chat_message_type.dart';
import 'package:doctor_app/components/constants.dart';
import 'package:flutter/material.dart';

class ChatMessageWidget extends StatelessWidget {
  final String text;
  final ChatMessageType chatMessageType;
  const ChatMessageWidget(
      {super.key, required this.text, required this.chatMessageType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      color: chatMessageType == ChatMessageType.bot
          ? const Color(0xff16A7E1).withOpacity(0.65)
          : const Color(0xffD7D7D7).withOpacity(0.38),
      child: Row(children: [
        chatMessageType == ChatMessageType.bot
            ? Container(
                margin: const EdgeInsets.only(right: 16),
                child: CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  child: SizedBox(
                    height: 24,
                    child: Image.asset('assets/images/doctor-assistant.png',
                        scale: 1.5),
                  ),
                ),
              )
            : Container(
                margin: const EdgeInsets.only(right: 16),
                child: CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  child: SizedBox(
                      height: 24,
                      child:
                          Image.asset('assets/images/talker-01.png', scale: 2)),
                ),
              ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: kTextColor),
              ),
            )
          ],
        ))
      ]),
    );
  }
}
