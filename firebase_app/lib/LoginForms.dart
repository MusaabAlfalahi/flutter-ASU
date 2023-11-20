import 'package:flutter/material.dart';
import 'AuthenticationMethods.dart';
import 'HomePage.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Column(
            children: [
              FlutterLogo(),
              Text("welcome"),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const LoginForm(),
          Row(
            children: [
              const Text(
                "New here ?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                child: const Text("Get Registered Now!!"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    ),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obs = true;
  var ic = Icons.visibility;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          TextFormField(
            controller: email,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please Enter Your Name";
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: password,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: GestureDetector(
                child: IconButton(
                  onPressed: () {
                    obs = !obs;
                    if (ic == Icons.visibility) {
                      ic = Icons.visibility_off;
                    } else {
                      ic = Icons.visibility;
                    }
                  },
                  icon: Icon(ic),
                ),
              ),
              labelText: "Password",
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100))),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please Enter your password";
              } else {
                return null;
              }
            },
            obscureText: obs,
          ),
          ElevatedButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  AuthenticationHelper()
                      .signin(email: email.text, password: password.text)
                      .then((result) {
                    if (result == null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: result));
                    }
                  });
                }
              },
              child: const Text("Login"))
        ],
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
