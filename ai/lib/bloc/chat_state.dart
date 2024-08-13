part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatSuccessState extends ChatState {
  final List<ChatMessageModel> messages;
  final bool generating;

  const ChatSuccessState({
    required this.messages,
    this.generating = false,
  });

  @override
  List<Object> get props => [messages, generating];
}
