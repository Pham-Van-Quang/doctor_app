import 'package:doctor_app/common/chat_message_type.dart';
import 'package:doctor_app/view/conversation/model/conversation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationCubit extends Cubit<ConversationState> {
  ConversationCubit()
      : super(ConversationState(messages: [], isLoading: false));

  void addMessage(ChatMessage message) {
    final updatedMessages = [...state.messages, message];
    emit(state.copyWith(messages: updatedMessages));
  }

  void setLoading(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
  }
}
