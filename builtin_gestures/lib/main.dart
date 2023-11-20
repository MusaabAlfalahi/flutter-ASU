import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                print("Press on Elevated Button");
              },
              onLongPress: () {
                print("long Pressed on Elevated Button");
              },
              child: const Text("Elevate button")),
          OutlinedButton(
              onPressed: () {
                print("Press on Outlined Button");
              },
              onLongPress: () {
                print("long Pressed on Outlined Button");
              },
              child: const Text("Outlined button")),
          TextButton(
              onPressed: () {
                print("Press on TextButton");
              },
              onLongPress: () {
                print("long Pressed on TextButton");
              },
              child: const Text("TextButton")),
          IconButton(
              onPressed: () {
                print("Press on IconButton");
              },
              icon: const Icon(Icons.delete)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigation),
        onPressed: () {
          print("Press on FloatingActionButton");
        },
      ),
    ));
  }
}
