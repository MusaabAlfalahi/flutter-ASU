import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  var switchValue = true;
  var sliderV = 10;
  String? dept;
//String ?dept2;
  List<bool> checkedB = [false, false, false, false];
  List<String> countryL = ["Jordan", "Palestine", "Kuwait", "Qatar"];
  String dropValue = "Jordan";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Stateful App"),
            ),
            body: SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Full Name",
                      hintText: "Please Enter your name"),
                ),
                const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Student number",
                      hintText: "Please Enter your number"),
                ),
                const Divider(),
                const Text("Switch widget"),
                Switch(
                  value: switchValue,
                  activeColor: Colors.green,
                  onChanged: (bool newValue) {
                    setState(() {
                      switchValue = newValue;
                    });
                  },
                ),

                /*  switchValue ? Text("Ahmad", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),) 
                        : 
                        Text("Ahmad", style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),), 
        */
                switchValue
                    ? MyText("Change Style", Colors.green, FontWeight.bold)
                    : MyText("Normal Style", Colors.black, FontWeight.normal),

                // Text('$switchValue'),
                const Divider(),
                /*Text("Select your department")
 ,
         RadioListTile(
          title:Text("Computer Science"),
          value: "CS",
          groupValue: dept,
          onChanged: ((newvalue)  {
            setState(() {
                           dept=newvalue;

            });
          })
         ),
          RadioListTile(
          title:Text("Software Engineering"),
          value: "SE",
          groupValue: dept,
          onChanged: ((newvalue)  {
            setState(() {
                           dept=newvalue;

            });
          })
         )
         ,
          RadioListTile(
          title:Text("Data Science"),
          value: "DS",
          groupValue: dept,
          onChanged: ((newvalue)  {
            setState(() {
                           dept=newvalue;
            });
          })
         ),
 
          RadioListTile(
          title:Text("Cyber Security"),
          value: "CCCs",
          groupValue: dept,
          onChanged: ((newvalue)  {
            setState(() {
                           dept=newvalue;

            });
          })
         ),
         Text('your department is $dept')
       ,
       Text("Select your favoirite programming Languages")
       ,
  /* Text("Java"),
       Checkbox(value: checkedB[0], onChanged: ((bool ?newValue) {
       setState(() {
          checkedB[0]=newValue!;
          });
       }))*/
       CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title:Text("Java"),
       value: checkedB[0], 
       onChanged: ((bool ?newValue) {
       setState(() {
          checkedB[0]=newValue!;
          });
       }))
       , CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,

        title:Text("C#"),
       value: checkedB[1], 
       onChanged: ((bool ?newValue) {
       setState(() {
          checkedB[1]=newValue!;
          });
       }))
       
        , CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,

        title:Text("Dart"),
       value: checkedB[2], 
       onChanged: ((bool ?newValue) {
       setState(() {
          checkedB[2]=newValue!;
          });
       }))
       , CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,

        title:Text("Python"),
       value: checkedB[3], 
       onChanged: ((bool ?newValue) {
       setState(() {
          checkedB[3]=newValue!;
          });
       }))
       ,Text('$checkedB'),
       */

                const Text("Rate This application"),
                Slider(
                  value: sliderV.toDouble(),
                  min: 0,
                  max: 50,
                  divisions: 10,
                  activeColor: Colors.blue,
                  inactiveColor: Colors.grey,
                  label: sliderV.toString(),
                  onChanged: (double newValue) {
                    setState(() {
                      sliderV = newValue.round();
                    });
                  },
                ),
                Text(sliderV.toString()),
                const Text("Select Your Country"),
                DropdownButton(
                    value: dropValue,
                    items: countryL
                        .map<DropdownMenuItem<String>>((String newValue) {
                      return DropdownMenuItem<String>(
                          value: newValue, child: Text(newValue));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropValue = newValue!;
                      });
                    }),
                Text(dropValue),
                DropdownButton(
                    value: 10,
                    items: [10, 20, 30, 40]
                        .map<DropdownMenuItem<int>>((int newValue) {
                      return DropdownMenuItem<int>(
                          value: newValue, child: Text(newValue.toString()));
                    }).toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        dropValue = newValue.toString();
                      });
                    }),
              ],
            ))));
  }
}

class MyText extends StatelessWidget {
  String text;
  Color fC;
  FontWeight fW;
  MyText(this.text, this.fC, this.fW, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: fC, fontWeight: fW),
    );
  }
}
