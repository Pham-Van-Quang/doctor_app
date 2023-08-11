import 'package:doctor_app/common/chat_message_type.dart';

class ConversationState {
  final List<ChatMessage> messages;
  final bool isLoading;

  ConversationState({required this.messages, required this.isLoading});

  ConversationState copyWith({List<ChatMessage>? messages, bool? isLoading}) {
    return ConversationState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
