import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'BMI Calculater'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgcolor = Colors.orange.shade300;
  var alert = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          color: bgcolor,
          child: Center(
            child: SizedBox(
              width: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'BMI',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: const InputDecoration(
                      label: Text('Enter your weight in kg'),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: const InputDecoration(
                      label: Text('Enter your Height(in ft)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: inController,
                    decoration: const InputDecoration(
                      label: Text('Enter your height in inch'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inController.text.toString();

                        if (wt != "" && ft != "" && inch != "") {
                          var iwt = int.parse(wt);
                          var ift = int.parse(ft);
                          var iinch = int.parse(inch);

                          var tinch = (ift * 12) + iinch;

                          var tcm = tinch * 2.54;

                          var tm = tcm / 100;
                          var bmi = iwt / (tm * tm);
                          var alert = "";

                          if (bmi > 25) {
                            alert = 'you are OverWeight !!';
                            bgcolor = Colors.red;
                          } else if (bmi < 18) {
                            alert = 'you are underWeight';
                            bgcolor = Colors.lime;
                          } else {
                            alert = 'You are perfectly fine and healthy';
                            bgcolor = Colors.green;
                          }

                          setState(() {
                            result =
                                'Your BMI is = ${bmi.toStringAsFixed(3)} \n ${alert}';
                          });
                        } else {
                          setState(() {
                            result = "Please fill the required blanks!!";
                          });
                        }
                      },
                      child: const Text("calculate")),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    result,
                    style: const TextStyle(fontSize: 15, color: Colors.green),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Column(
                    children: [
                      Positioned(
                        bottom: 2,
                        child: Text('bmi > 25 = you are OverWeight !! \n'
                            'bmi < 18 = you are underWeight\n'
                            'bmi <25 &&  bmi >18 =You are perfectly fine and healthy'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
