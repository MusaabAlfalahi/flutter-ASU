import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Laptop();
  }
}

class Laptop extends StatefulWidget {
  const Laptop({super.key});

  @override
  State<Laptop> createState() => _LaptopState();
}

enum processorEnum { i3, i5, i7, i9 }

class _LaptopState extends State<Laptop> {
  @override
  processorEnum? processor;
  String? manufacturestr = "Asus";
  List<String> manufacture = ["Asus", "Acer", "Hp", "Lenovo", "Dell"];
  final Textcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final messengerKey = GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: messengerKey,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Laptop Information"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: const EdgeInsets.all(30),
            padding: const EdgeInsets.all(30),
            child: Form(
              key: formKey,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Please Fill Your Laptop Information",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 750,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.laptop),
                            label: Text("Laptop Name"),
                            hintText: "Laptop Name",
                            border: OutlineInputBorder(),
                          ),
                          controller: Textcontroller,
                          validator: validName,
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 50,
                        width: 500,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Processor:"),
                            Radio(
                              value: processorEnum.i3,
                              groupValue: processor,
                              onChanged: ((value) {
                                setState(() {
                                  processor = value;
                                });
                              }),
                            ),
                            const Text("I3"),
                            Radio(
                              value: processorEnum.i5,
                              groupValue: processor,
                              onChanged: ((value) {
                                setState(() {
                                  processor = value;
                                });
                              }),
                            ),
                            const Text("I5"),
                            Radio(
                              value: processorEnum.i7,
                              groupValue: processor,
                              onChanged: ((value) {
                                setState(() {
                                  processor = value;
                                });
                              }),
                            ),
                            const Text("I7"),
                            Radio(
                              value: processorEnum.i9,
                              groupValue: processor,
                              onChanged: ((value) {
                                setState(() {
                                  processor = value;
                                });
                              }),
                            ),
                            const Text("I9"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("manufacture:"),
                            SizedBox(
                              width: 100,
                              child: DropdownButtonFormField<String>(
                                  value: manufacturestr,
                                  items: [
                                    DropdownMenuItem(
                                        value: manufacture[0],
                                        child: const Text("Asus")),
                                    DropdownMenuItem(
                                        value: manufacture[1],
                                        child: const Text("Acer")),
                                    DropdownMenuItem(
                                        value: manufacture[2],
                                        child: const Text("Hp")),
                                    DropdownMenuItem(
                                        value: manufacture[3],
                                        child: const Text("Lenovo")),
                                    DropdownMenuItem(
                                        value: manufacture[4],
                                        child: const Text("Dell")),
                                  ],
                                  onChanged: (String? newValue) {
                                    manufacturestr = newValue!;
                                  }),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              print(Textcontroller.text);
                              var snackBar = const SnackBar(
                                content: Text("Sent"),
                                backgroundColor: Colors.blue,
                                showCloseIcon: true,
                                duration: Duration(seconds: 1),
                              );
                              messengerKey.currentState!.showSnackBar(snackBar);
                            }
                            formKey.currentState!.save();
                          },
                          child: const Text("Submit"))
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String? validName(String? value) {
  if (value!.isNotEmpty) {
    return null;
  } else {
    return "No value exists";
  }
}
