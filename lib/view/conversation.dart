// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:doctor_app/components/api_chatgpt.dart';
import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/common/chat_message_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class Conversation extends StatefulWidget {
  const Conversation({super.key});

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  late bool isLoading;
  final TextEditingController _textController = TextEditingController();
  final _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  Future<String> generateResponse(String prompt) async {
    const apiKey = apiSecretKey;
    var url = Uri.https("api.openai.com", "/v1/completions");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $apiKey"
      },
      body: jsonEncode({
        "model": "text-davinci-003",
        "prompt": prompt,
        'temperature': 0,
        'max_tokens': 2000,
        'top_p': 1,
        'frequency_penalty': 0.0,
        'presence_penalty': 0.0,
      }),
    );
    Map<String, dynamic> newresponse = jsonDecode(response.body);
    return newresponse['choices'][0]['text'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kTextColor,
            )),
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        title: Text('Trợ lý thông minh',
            style: Theme.of(context).textTheme.displayMedium),
      ),
      body: Column(
        children: [
          Expanded(child: _builtList()),
          Visibility(
              visible: isLoading,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                _builtInput(),
                _builtSubmit(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Expanded _builtInput() {
    return Expanded(
        child: TextField(
      controller: _textController,
      textCapitalization: TextCapitalization.sentences,
      style: const TextStyle(color: kTextColor),
      decoration: const InputDecoration(
        fillColor: Color.fromARGB(245, 234, 234, 234),
        filled: true,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    ));
  }

  Widget _builtSubmit() {
    return Visibility(
        visible: !isLoading,
        child: Container(
          child: IconButton(
              onPressed: () {
                setState(() {
                  _messages.add(
                    ChatMessage(
                      text: _textController.text,
                      chatMessageType: ChatMessageType.user,
                    ),
                  );
                  isLoading = true;
                });
                var input = _textController.text;
                _textController.clear();
                Future.delayed(const Duration(milliseconds: 50))
                    .then((_) => _scrollDown());
                generateResponse(input).then((value) {
                  setState(() {
                    isLoading = false;
                    _messages.add(
                      ChatMessage(
                        text: value,
                        chatMessageType: ChatMessageType.bot,
                      ),
                    );
                  });
                });
                _textController.clear();
                Future.delayed(const Duration(milliseconds: 50))
                    .then((_) => _scrollDown());
              },
              icon: SvgPicture.asset(
                'assets/icons/send.svg',
              )),
        ));
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  ListView _builtList() {
    return ListView.builder(
        itemCount: _messages.length,
        controller: _scrollController,
        itemBuilder: ((context, index) {
          var message = _messages[index];
          return ChatMessageWidget(
            text: message.text,
            chatMessageType: message.chatMessageType,
          );
        }));
  }
}

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
