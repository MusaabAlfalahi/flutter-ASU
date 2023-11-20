import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SelectionButton(),
      ),
    );
  }
}

class SelectionButton extends StatefulWidget {
  const SelectionButton({super.key});

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        navigationSelection(context);
      },
      child: const Text("pick your favourite programming language"),
    );
  }

  Future<void> navigationSelection(BuildContext context) async {
    final res = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => const SelectionScreen()),
      ),
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$res")));
  }
}

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, "Java");
                },
                child: const Text("Java")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, "C#");
                },
                child: const Text("C#")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, "Dart");
                },
                child: const Text("Dart")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, "Python");
                },
                child: const Text("Python")),
          ],
        ),
      ),
    );
  }
}
