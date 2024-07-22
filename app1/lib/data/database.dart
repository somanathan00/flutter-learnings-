
// ignore_for_file: unused_local_variable

import 'package:hive_flutter/adapters.dart';
class ToDoDatabase{
  List toDoList = [];
 final _mybox=Hive.box("mybox");
  
 void createinitialdata() {
  List toDoList = [
    ["Learn flutter", false],
    ["develop flutter app", false]
  ];
 }

  void loaddata() {
    toDoList=_mybox.get("TODOLIST");
  }

  void updatedatabase(){
  _mybox.put("TODOLIST", toDoList );
    }
}