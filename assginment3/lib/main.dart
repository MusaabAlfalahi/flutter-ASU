import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<double, String>> items = [
    {1.25: "Turkish"},
    {1.5: "Latte"},
    {2.0: "Longo"},
  ];

  TextEditingController priceCont = TextEditingController();
  TextEditingController coffeeCont = TextEditingController();

  void InsertItem() {
    setState(() {
      items.add({double.tryParse(priceCont.text)!: coffeeCont.text});
      priceCont.clear();
      coffeeCont.clear();
    });
  }

  void RemoveItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Study Coffee Corner"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: priceCont,
                decoration: InputDecoration(
                  label: const Text('Price'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              TextFormField(
                controller: coffeeCont,
                decoration: InputDecoration(
                  label: const Text('Coffee'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: InsertItem,
                child: const Text("Insert Coffee Drink"),
              ),
              Container(
                color: const Color.fromRGBO(255, 193, 50, 250),
                child: items.isEmpty
                    ? const Text(
                        "No More Coffee drinks",
                        style: TextStyle(color: Colors.green),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: Key(items[index].toString()),
                            background: Container(
                              color: Colors.red,
                              padding: const EdgeInsets.all(20),
                              alignment: Alignment.centerRight,
                              child: const Icon(
                                Icons.delete,
                              ),
                            ),
                            onDismissed: (DismissDirection direction) {
                              if (direction == DismissDirection.endToStart) {
                                RemoveItem(index);
                              }
                            },
                            child: Card(
                              color: Colors.lightBlue,
                              elevation: 10,
                              child: ListTile(
                                leading: const Icon(Icons.coffee),
                                title: Text(items[index].values.first),
                                subtitle:
                                    Text(items[index].keys.first.toString()),
                                trailing: Text("${items[index].keys.first} JD"),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
