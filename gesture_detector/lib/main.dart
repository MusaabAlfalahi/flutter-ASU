import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [MyContainer(), MyCard(), MyIcon()],
        ),
      ),
    );
  }
}

class MyContainer extends StatefulWidget {
  const MyContainer({super.key});

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Color defaultColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 100,
        height: 100,
        color: defaultColor,
        child: const Text("Clickable Container"),
      ),
      onTap: () {
        setState(() {
          defaultColor = Colors.green;
        });
      },
      onDoubleTap: () {
        setState(() {
          defaultColor = Colors.purple;
        });
      },
      onLongPress: () {
        setState(() {
          defaultColor = Colors.blue;
        });
      },
    );
  }
}

class MyCard extends StatefulWidget {
  const MyCard({super.key});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Color CardColor = Colors.blue;
  bool forcolor = true;
  bool forshape = true;
  ShapeBorder CardShape = const RoundedRectangleBorder();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: forcolor ? Colors.green : Colors.blue,
        shape: forshape ? const CircleBorder() : const RoundedRectangleBorder(),
        child: const SizedBox(
          width: 300,
          height: 300,
        ),
      ),
      onTap: () {
        setState(() {
          forcolor = !forcolor;
          // if (CardColor == Colors.green) {
          //   CardColor = Colors.blue;
          // } else {
          //   CardColor = Colors.green;
          // }
        });
      },
      onDoubleTap: () {
        setState(() {
          forshape = !forshape;
          // if (CardShape == RoundedRectangleBorder()) {
          //   CardShape = CircleBorder();
          // } else {
          //   CardShape = RoundedRectangleBorder();
          // }
        });
      },
    );
  }
}

class MyIcon extends StatefulWidget {
  const MyIcon({super.key});

  @override
  State<MyIcon> createState() => _MyIconState();
}

class _MyIconState extends State<MyIcon> {
  @override
  bool ontabchangeicon = true;
  bool ondoubletapcolorchange = true;
  bool onlongtapsizechange = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(ontabchangeicon ? Icons.laptop : Icons.abc,
          color: ondoubletapcolorchange ? Colors.blue : Colors.green,
          size: 100 //onlongtapsizechange? 100:500,
          ),
      onTap: () {
        setState(() {
          ontabchangeicon = !ontabchangeicon;
        });
      },
      onDoubleTap: () {
        setState(() {
          ondoubletapcolorchange = !ondoubletapcolorchange;
        });
      },
      // onLongPress: () => setState(() {
      //   onlongtapsizechange = !onlongtapsizechange;
      // }),
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("First Dialog"),
            content: const Text("Long Pressed Action"),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.pop(context, "OK"),
                  child: const Text("OK")),
              TextButton(
                  onPressed: () => Navigator.pop(context, "Cancel"),
                  child: const Text("Cancel")),
            ],
          ),
        );
      },
    );
  }
}
