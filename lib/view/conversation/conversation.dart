// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:doctor_app/components/api_chatgpt.dart';
import 'package:doctor_app/components/constants.dart';
import 'package:doctor_app/common/chat_message_type.dart';
import 'package:doctor_app/view/conversation/items/chat_message_widget.dart';
import 'package:doctor_app/view/conversation/model/conversation_cubit.dart';
import 'package:doctor_app/view/conversation/model/conversation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class Conversation extends StatefulWidget {
  const Conversation({super.key});

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  final TextEditingController _textController = TextEditingController();
  final _scrollController = ScrollController();
  final ConversationCubit conversationCubit = ConversationCubit();

  @override
  void initState() {
    super.initState();
    conversationCubit;
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

    if (newresponse['choices'] != null && newresponse['choices'].isNotEmpty) {
      return newresponse['choices'][0]['text'];
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationCubit, ConversationState>(
      builder: (context, state) {
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
              Expanded(child: _builtList(state.messages)),
              Visibility(
                  visible: state.isLoading,
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
                    _builtSubmit(state),
                  ],
                ),
              )
            ],
          ),
        );
      },
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

  Widget _builtSubmit(ConversationState state) {
    return IconButton(
      onPressed: () async {
        final input = _textController.text;
        if (input.isNotEmpty) {
          conversationCubit.setLoading(true);
          conversationCubit.addMessage(ChatMessage(
            text: input,
            chatMessageType: ChatMessageType.user,
          ));

          final response = await generateResponse(input);
          if (response.isNotEmpty) {
            conversationCubit.addMessage(ChatMessage(
              text: response,
              chatMessageType: ChatMessageType.bot,
            ));
          }

          conversationCubit.setLoading(false);
          _textController.clear();
          Future.delayed(const Duration(milliseconds: 50))
              .then((_) => _scrollDown());
        }
      },
      icon: SvgPicture.asset('assets/icons/send.svg'),
    );
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  ListView _builtList(List<ChatMessage> messages) {
    return ListView.builder(
        itemCount: messages.length,
        controller: _scrollController,
        itemBuilder: ((context, index) {
          var message = messages[index];
          return ChatMessageWidget(
            text: message.text,
            chatMessageType: message.chatMessageType,
          );
        }));
  }
}
