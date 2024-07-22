// ignore_for_file: must_be_immutable

import 'package:app1/util/my_button.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({super.key
  ,required this.controller,
  required this.onSave,
  required this.onCancel 
  } );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepOrange,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Add New Text',
              hintStyle: TextStyle(color: Colors.white),
              
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(text: ("Save"), onPressed: onSave),
                const SizedBox(width: 5,),
                MyButton(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
