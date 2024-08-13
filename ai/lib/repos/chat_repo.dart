import 'dart:developer';
import 'package:ai/models/chat_message_model.dart';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatRepo {
  static Future<String> chatTextGenerationRepo(List<ChatMessageModel> previousMessage)async{
    await dotenv.load(fileName: ".env"); 
 
    try {
      
      Dio dio = Dio();
    final response= await dio.post("https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-pro:generateContent?key=${dotenv.env['API_KEY']!}",
    data: {
  "contents": previousMessage.map((e)=>e.toMap()).toList(),
  "generationConfig": {
    "temperature": 1,
    "topK": 64,
    "topP": 0.95,
    "maxOutputTokens": 8192,
    "responseMimeType": "text/plain"
  }
});

print(response);
if (response.statusCode!>=200&& response.statusCode!<300){
      return response.data['candidates'].first['content']['parts'].first['text'];
    }
 return '';
    } catch (e) {
      log(e.toString());
      print(e.toString());
      return'';
    }
 
}}

// {}