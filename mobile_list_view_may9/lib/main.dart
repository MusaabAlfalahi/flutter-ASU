import 'package:flutter/material.dart';

class Mobile {
  String title;
  bool isBought;
  Mobile(this.title, this.isBought);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: MobileListWidget()),
    );
  }
}

class MobileListWidget extends StatefulWidget {
  const MobileListWidget({super.key});

  @override
  State<MobileListWidget> createState() => _MobileListWidgetState();
}

class _MobileListWidgetState extends State<MobileListWidget> {
  @override
  Color def = Colors.white;
  List<Mobile> mobileList = [
    Mobile("Apple", false),
    Mobile("samsung", false),
    Mobile("Lenovo", false)
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: mobileList.length,
        itemBuilder: ((context, index) {
          return Dismissible(
            background: Container(
              color: Colors.purple,
              child: const Icon(
                Icons.done,
                color: Colors.green,
              ),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              child: const Icon(
                Icons.clear,
                color: Colors.yellow,
              ),
            ),
            key: UniqueKey(), //ValueKey<Mobile>(mobileList[index]),
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                setState(() {
                  mobileList.removeAt(index);
                });
              } else {
                setState(() {
                  mobileList[index].isBought = true;
                });
              }
            },
            child: Container(
              color: def,
              child: ListTile(
                leading: const Icon(Icons.mobile_friendly),
                title: Text(
                  mobileList[index].title,
                  style: TextStyle(
                    decoration: mobileList[index].isBought
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                onTap: () {
                  setState(() {
                    def == Colors.white ? def = Colors.green : def= Colors.white;
                  });
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
