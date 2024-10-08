part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class ChatGenerateNewTextMessageEvent extends ChatEvent{
  final String inputMessage;

  ChatGenerateNewTextMessageEvent({required this.inputMessage});

}