// ignore_for_file: unused_field

import 'package:app1/data/database.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/util/dialog_box.dart';
import '/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  late Box _mybox;
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    super.initState();
    _initializeHive();
  }

  Future<void> _initializeHive() async {
    _mybox = await Hive.openBox("mybox");
    if (_mybox.get("TODOLIST") == null) {
      db.createinitialdata();
    } else {
      db.loaddata();
    }
    setState(() {}); // Rebuild the widget after loading data
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    db.updatedatabase();
    Navigator.of(context).pop();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updatedatabase();
  }

  void deleteTask(BuildContext context, int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updatedatabase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("TO DO",),
      
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.logout)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
      body: _mybox.isOpen
          ? ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  taskname: db.toDoList[index][0],
                  taskcompleted: db.toDoList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deletefnction: (context) => deleteTask(context, index),
                );
              },
            )
          : const Center(child: CircularProgressIndicator()),
          bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings,color: Colors.deepOrange,),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person,color: Colors.deepOrange,),
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return const SettingsPage();
              },
            );
          } else if (index == 1) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          }
        },
    ));
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Settings",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text("Theme"),
            onTap: () {
              // Handle theme change
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("Notifications"),
            onTap: () {
              // Handle notifications settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text("Privacy"),
            onTap: () {
              // Handle privacy settings
            },
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  "https://www.w3schools.com/w3images/avatar2.png",
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Somanathan",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "somanathan@gmail.com",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}