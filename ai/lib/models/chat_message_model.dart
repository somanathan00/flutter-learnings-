import 'dart:convert';

class ChatMessageModel {
  final String role;
  final List<ChartPartModel> parts;

  ChatMessageModel({required this.role, required this.parts});

  Map<String, dynamic> toMap() {
    return {
      'role': role,
      'parts': parts.map((x) => x.toMap()).toList(),
    };
  }

  factory ChatMessageModel.fromMap(Map<String, dynamic> map) {
    return ChatMessageModel(
      role: map['role'] ?? '',
      parts: List<ChartPartModel>.from(map['parts']?.map((x) => ChartPartModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessageModel.fromJson(String source) => ChatMessageModel.fromMap(json.decode(source));
}

class ChartPartModel {
  final String text;

  ChartPartModel({required this.text});

  Map<String, dynamic> toMap() {
    return {
      'text': text,
    };
  }

  factory ChartPartModel.fromMap(Map<String, dynamic> map) {
    return ChartPartModel(
      text: map['text'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChartPartModel.fromJson(String source) => ChartPartModel.fromMap(json.decode(source));
}
