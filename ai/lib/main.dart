import 'package:ai/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ai/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ChatBloc()),],
      child: SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
          theme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.grey.shade900,
            primaryColor: Colors.deepPurple.shade300,
          ),
        ),
      ),
    );
  }
}
