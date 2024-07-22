import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MyPhotos(),
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
      ),
    );
  }
}

class MyPhotos extends StatelessWidget {
  const MyPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("My Photos"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ImageCollectionPage(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            textStyle: const TextStyle(fontSize: 18),
          ),
          child: const Text("Go to My Image Collection"),
        ),
      ),
    );
  }
}

class ImageCollectionPage extends StatefulWidget {
  const ImageCollectionPage({super.key});

  @override
  State<ImageCollectionPage> createState() => _ImageCollectionPageState();
}

class _ImageCollectionPageState extends State<ImageCollectionPage> {
  bool _isClicked = false;
  final List<String> _images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJ5qRiUKXdZA1qt2RK6otiD6KTeLP6IimYfw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEe8RVSq7yTBE9nI-tHCO8oPP-Ke58QeVlQQ&s",
    "https://cdn.fstoppers.com/styles/full/s3/media/2019/12/04/nando-jpeg-quality-006-too-much.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Image Collection"),
        backgroundColor: Colors.deepOrange,
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _isClicked = !_isClicked;
          });
        },
        child: Center(
          child: _isClicked
              ? Image.asset("images/images.jpeg",width: 300,height: 400,)
              : ListView.builder(
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(_images[index],width: 200,height: 400,),
                    );
                  },
                ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings,color: Colors.deepOrange,),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person,color: Colors.deepOrange),
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
      ),
    );
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
      backgroundColor: Colors.black,
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
