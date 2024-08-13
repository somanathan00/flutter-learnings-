import 'dart:async';

import 'package:ai/models/chat_message_model.dart';
import 'package:ai/repos/chat_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatSuccessState(messages: [])) {
    on<ChatGenerateNewTextMessageEvent>(chatGenerateNewTextMessageEvent);
  }

  Future<void> chatGenerateNewTextMessageEvent(
    ChatGenerateNewTextMessageEvent event,
    Emitter<ChatState> emit,
  ) async {
    final currentState = state as ChatSuccessState;
    final List<ChatMessageModel> updatedMessages = List.from(currentState.messages)
      ..add(ChatMessageModel(role: "user", parts: [ChartPartModel(text: event.inputMessage)]));

    emit(ChatSuccessState(messages: updatedMessages, generating: true));

    String generatedText = await ChatRepo.chatTextGenerationRepo(updatedMessages);
    if (generatedText.isNotEmpty) {
      updatedMessages.add(ChatMessageModel(role: "model", parts: [ChartPartModel(text: generatedText)]));
      emit(ChatSuccessState(messages: updatedMessages, generating: false));
    } else {
      emit(ChatSuccessState(messages: updatedMessages, generating: false));
    }
  }
}
