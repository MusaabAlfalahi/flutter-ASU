import 'package:flutter/material.dart';

void main() {
  runApp(const DynamicListView());
}

class DynamicListView extends StatefulWidget {
  const DynamicListView({super.key});

  @override
  State<DynamicListView> createState() => _nameState();
}

class _nameState extends State<DynamicListView> {
  List<String> items =
      List<String>.generate(100, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Dismissible(
                    key: Key(item),
                    onDismissed: (direction) {
                      setState(() {
                        items.removeAt(index);
                      });
                      print("Deleted $item");
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("$item dismissed")));
                    },
                    background: Container(color: Colors.green),
                    child: ListTile(title: Text(item)));
              })),
    );
  }
}

/// *******************************************
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(children: [
          ListTile(
              leading: const Icon(Icons.car_rental),
              title: const Text("By Car"),
              trailing: Wrap(
                children: [
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      print("new selected car");
                    },
                  ),
                  IconButton(
                      onPressed: () => print("you pressed delete"),
                      icon: const Icon(Icons.delete)),
                  IconButton(
                      onPressed: () => print("you pressed add"),
                      icon: const Icon(Icons.add))
                ],
              )

              // onTap: () {
              //   print("new selected car");
              // },
              ),
          ListTile(
              leading: const Icon(Icons.bus_alert),
              title: const Text("By Bus"),
              trailing: Wrap(
                children: [
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      print("you selected Bus");
                    },
                  ),
                  IconButton(
                      onPressed: () => print("you pressed delete for bus item"),
                      icon: const Icon(Icons.delete)),
                  IconButton(
                      onPressed: () => print("you pressed add on bus item"),
                      icon: const Icon(Icons.add))
                ],
              )

              // onTap: () {
              //   print("new selected car");
              // },
              ),
          ListTile(
              leading: const Icon(Icons.train),
              title: const Text("By Train"),
              trailing: Wrap(
                children: [
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      print("you selected Train");
                    },
                  ),
                  IconButton(
                      onPressed: () =>
                          print("you pressed delete for Train item"),
                      icon: const Icon(Icons.delete)),
                  IconButton(
                      onPressed: () => print("you pressed add on Train item"),
                      icon: const Icon(Icons.add))
                ],
              )

              // onTap: () {
              //   print("new selected car");
              // },
              )
        ]),
      ),
    );
  }
}
