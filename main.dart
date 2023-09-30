import 'package:calculator/home.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  var userInput = " ";
  var result = " ";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(children: [
                      Text(userInput.toString(),
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white)),
                      Text(result.toString(),
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white)),
                    ]),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    
                    children: [
                      Row(
                        children: [
                          MyButton(
                            title: 'AC',
                            onPress: () {
                              userInput = '';
                              result = '';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '+/-',
                            onPress: () {
                              userInput += '+/-';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '%',
                            onPress: () {
                              userInput += '%';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '/',
                            color: Colors.deepOrange,
                            onPress: () {
                              userInput += '/';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '7',
                            onPress: () {
                              userInput +=  '7';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '8',
                            onPress: () {
                              userInput +=  '8';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '0',
                            onPress: () {
                              userInput += '0';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: 'x',
                            color: Colors.deepOrange,
                            onPress: () {
                              userInput += 'x';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '4',
                            onPress: () {
                              userInput += '4';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '5',
                            onPress: () {
                              userInput +=  '5';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '6',
                            onPress: () {
                              userInput +=  '6';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '-',
                            color: Colors.deepOrange,
                            onPress: () {
                              userInput += '-';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '1',
                            onPress: () {
                              userInput += '1';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '2',
                            onPress: () {
                              userInput +=  '2';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '3',
                            onPress: () {
                              userInput +=  '3';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '+',
                            color: Colors.deepOrange,
                            onPress: () {
                              userInput += '+';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '0',
                            onPress: () {
                              userInput += '0';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '.',
                            onPress: () {
                              userInput += '.';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: 'DEL',
                            onPress: () {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '=',
                            color: Colors.deepOrange,
                            onPress: () {
                              equalPress();
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ))),
    );
  }

  void equalPress() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    result = eval.toString();
  }
}

class MyButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;

  const MyButton(
      {Key? key,
      required this.title,
      this.color = const Color(0xffa5a5a5),
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
          onTap: onPress,
          child: Container(
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              child: Center(child: Text(title, style: headingTextStyle)))),
    ));
  }
}

  
  
   