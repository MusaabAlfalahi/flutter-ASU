import 'package:firebase_app/AuthenticationMethods.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: const Center(
        child: Text("Welcome"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AuthenticationHelper().signout().then((value) {
            if (value == null) {
              Navigator.pop(context);
            } else {
              return;
            }
          });
        },
      ),
    );
  }
}
