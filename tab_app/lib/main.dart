import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tab Navigation"),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.android),
              ),
              Tab(
                icon: Icon(Icons.phone_android),
              ),
              Tab(
                icon: Icon(Icons.laptop),
              ),
              Tab(
                icon: Icon(Icons.laptop_windows),
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          tab1(),
          tab2(),
          tab3(),
          tab4(),
        ]),
      ),
    );
  }
}

class tab1 extends StatefulWidget {
  const tab1({super.key});

  @override
  State<tab1> createState() => _tab1State();
}

class _tab1State extends State<tab1> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Column(
        children: [Text("Android Page")],
      ),
    );
  }
}

class tab2 extends StatefulWidget {
  const tab2({super.key});

  @override
  State<tab2> createState() => _tab2State();
}

class _tab2State extends State<tab2> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Column(
        children: [Text("phone_android")],
      ),
    );
  }
}

class tab3 extends StatefulWidget {
  const tab3({super.key});

  @override
  State<tab3> createState() => _tab3State();
}

class _tab3State extends State<tab3> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Column(
        children: [Text("Laptop")],
      ),
    );
  }
}

class tab4 extends StatefulWidget {
  const tab4({super.key});

  @override
  State<tab4> createState() => _tab4State();
}

class _tab4State extends State<tab4> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Column(
        children: [Text("Laptop_windows")],
      ),
    );
  }
}
