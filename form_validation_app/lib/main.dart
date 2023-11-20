import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  final formKey = GlobalKey<FormState>(); //validate and save
  final messengerKey = GlobalKey<ScaffoldMessengerState>(); //snackbar
  int dropValue = 3;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: messengerKey,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Form App"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text("Name"),
                      hintText: "Enter your Name",
                      border: OutlineInputBorder()),
                  validator: validName,
                  onSaved: (String? newValue) {
                    print(newValue);
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text("Email"),
                      hintText: "Enter your Email",
                      border: OutlineInputBorder()),
                  validator: validEmail,
                  onSaved: (String? newValue) {
                    print(newValue);
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text("Phone"),
                      hintText: "Enter your phone number",
                      border: OutlineInputBorder()),
                  validator: validPhone,
                  onSaved: (String? newValue) {
                    print(newValue);
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  //keyboardType:TextInputType.text,
                  decoration: const InputDecoration(
                      label: Text("Password"),
                      hintText: "Enter your password",
                      border: OutlineInputBorder()),
                  obscureText: true,
                  validator: validPassword,
                  onSaved: (String? newValue) {
                    print(newValue);
                  },
                ),
                const SizedBox(height: 20),
                const Text("Select your department"),
                const SizedBox(height: 20),
                DropdownButtonFormField<int>(
                    value: dropValue,
                    items: const [
                      DropdownMenuItem(
                          value: 0, child: Text("Select your Dept")),
                      DropdownMenuItem(value: 1, child: Text("CS")),
                      DropdownMenuItem(value: 2, child: Text("SE")),
                      DropdownMenuItem(value: 3, child: Text("CSCC")),
                      DropdownMenuItem(value: 4, child: Text("DS")),
                      DropdownMenuItem(value: 5, child: Text("Gaming")),
                    ],
                    validator: validDept,
                    onChanged: (int? newValue) {
                      dropValue = newValue!;
                    }),
                ElevatedButton(
                  child: const Text("Submit"),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var snackBar = const SnackBar(
                        content: Text("Submitted"),
                        backgroundColor: Colors.purple,
                        showCloseIcon: true,
                        closeIconColor: Colors.blue,
                        duration: Duration(seconds: 10),
                      );
                      messengerKey.currentState!.showSnackBar(snackBar);
                    }
                    //print("Output");
                    formKey.currentState!.save();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String? validName(String? value) {
  if (value!.isNotEmpty) {
    if (value.length < 5) {
      return "Name must be greater than 5 chars";
    }
  } else {
    return "No value exists";
  }
  return null;
}

String? validPhone(String? value) {
  if (value!.isNotEmpty) {
    if (value.length != 10) {
      return "You must enter 10 numbers";
    }
  } else {
    return "No value exists for Phone";
  }
  return null;
}

String? validPassword(String? value) {
  if (value!.isNotEmpty) {
    if (value.length < 8) {
      return "You must enter at least 8 characters";
    }
  } else {
    return "No value exists for Phone";
  }
  return null;
}

String? validEmail(String? value) {
  RegExp reEx = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (value!.isEmpty) return "No entered email";
  if (!reEx.hasMatch(value)) {
    return "Invalid email";
  } else {
    return null;
  }
}

String? validDept(int? value) {
  if (value != 0) {
    return null;
  } else {
    return "select your dept";
  }
}
