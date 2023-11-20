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
    return Scaffold(
      appBar: AppBar(title: const Text("Drawer Application")),
      body: Center(
        child: Container(
          child: const Text("Main Page"),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("ASU Application"),
              accountEmail: Text("help@asu.edu.jo"),
              currentAccountPicture: FlutterLogo(),
              otherAccountsPictures: [Icon(Icons.help)],
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Go to page1"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Page1(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Go to page2"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Page2(),
                    ));
              },
            ),
            const AboutListTile(
              icon: Icon(Icons.help),
              applicationName: "My mobile app",
              applicationVersion: '1.2.35',
              applicationLegalese: '@2023ASu',
              child: Text("About App"),
            )
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            const Text("Page1"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}
class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            const Text("Page2"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Go Back"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Page1(),
                    ));
              },
              child: const Text("Go to Page1"),
            ),
          ],
        ),
      ),
    );
  }
}
