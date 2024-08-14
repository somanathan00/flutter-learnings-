import "package:block/features/home/home_page.dart";
import "package:block/features/posts/bloc/posts_bloc.dart";
import "package:block/features/posts/ui/post.dart";
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => PostsBloc()),],
      child: SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: PostPage(),
        ),
      ),
    );
     
  }
}
