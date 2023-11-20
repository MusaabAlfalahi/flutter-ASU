import 'package:flutter/material.dart';

class Item {
  String? name;
  double? price;
  Item(this.name, this.price);
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
      home: dismissible(),
    );
  }
}

class dismissible extends StatefulWidget {
  const dismissible({super.key});

  @override
  State<dismissible> createState() => _dismissibleState();
}

class _dismissibleState extends State<dismissible> {
  @override
  Color def = Colors.white;
  // Item i1 = Item(name, price)
  List<Item> listofobjects = [];
  List<String> Items = ["Flowers", "Accessories", "Mug", "Chocolate"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("dismissible widget")),
      body: ListView.builder(
        itemCount: Items.length,
        itemBuilder: (BuildContext context, int index) {
          final Item = Items[index];
          return Dismissible(
              background: Container(
                //left to right
                color: Colors.blue,
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.favorite),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "move to favorites",
                        style: TextStyle(color: Colors.purple),
                      ),
                    ],
                  ),
                ),
              ),
              secondaryBackground: Container(
                //right to left
                color: Colors.red,
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.delete),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "move to trash",
                        style: TextStyle(color: Colors.purple),
                      ),
                    ],
                  ),
                ),
              ),
              onDismissed: (DismissDirection direction) {
                setState(() {
                  Items.removeAt(index);
                });
              },
              confirmDismiss: (DismissDirection direction) {
                if (direction == DismissDirection.startToEnd) {
                  return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Add Gift to Cart"),
                        content: const Text(
                            "Are you sure you want to add gift in your cart"),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: const Text("Yes"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: const Text("No"),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Remove Gift"),
                        content: const Text(
                            "Are you sure you want to delete this gift"),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: const Text("Yes"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: const Text("No"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              key: Key(Item),
              child: Container(
                color: def,
                child: ListTile(
                  leading: const Icon(Icons.card_giftcard),
                  title: Text(Item),
                  subtitle: const Text("this gift to you"),
                  // hoverColor: Colors.red,
                  splashColor: Colors.black,
                  onTap: () {
                    setState(() {
                      def == Colors.white ? def = Colors.green : def= Colors.white;
                    });
                  },
                ),
              ));
        },
      ),
    );
  }
}
