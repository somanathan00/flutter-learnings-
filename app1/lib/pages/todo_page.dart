// ignore_for_file: prefer_interpolation_to_compose_strings

import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  TextEditingController mycontroller=TextEditingController();
  String grettingMessage='';
  void greetUser(){
    setState(() {
      grettingMessage="Hello,"+mycontroller.text;
    });
    

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(grettingMessage),
               TextField(
                controller: mycontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Type your name.."
                ,
              ),),ElevatedButton(onPressed: greetUser, child: Text("create user")),
            ],
          ),
        ),
      )
    );
  }
}