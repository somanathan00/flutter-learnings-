// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:app1/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  
  var box= await Hive.openBox("mybox");
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
    
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:HomePage(),
        theme: ThemeData( ),
      ),
    );
  }
}