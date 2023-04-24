import 'package:flutter/material.dart';
import 'my_button.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(
      const MaterialApp(debugShowCheckedModeBanner: false, home: Calculator()));
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userinput = '';
  var result = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    userinput.toString(),
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Text(
                    result.toString(),
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 2,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Row(children: [
                    MyButton(
                      title: 'AC',
                      onpress: () {
                        userinput = '';
                        result = '';
                        setState(() {});
                        // print('value');
                      },
                    ),
                    MyButton(
                      title: '<<',
                      onpress: () {
                        userinput =
                            userinput.substring(0, userinput.length - 1);
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '%',
                      onpress: () {
                        userinput += '%';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '/',
                      color: Colors.amber,
                      onpress: () {
                        userinput += '/';
                        setState(() {});
                      },
                    ),
                  ]),
                  Row(
                    children: [
                      MyButton(
                        title: '7',
                        onpress: () {
                          userinput += '7';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '8',
                        onpress: () {
                          userinput += '8';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '9',
                        onpress: () {
                          userinput += '9';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: 'x',
                        color: Colors.amber,
                        onpress: () {
                          userinput += 'x';
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '4',
                        onpress: () {
                          userinput += '4';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '5',
                        onpress: () {
                          userinput += '5';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '6',
                        onpress: () {
                          userinput += '6';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '-',
                        color: Colors.amber,
                        onpress: () {
                          userinput += '-';
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '1',
                        onpress: () {
                          userinput += '1';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '2',
                        onpress: () {
                          userinput += '2';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '3',
                        onpress: () {
                          userinput += '3';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '+',
                        color: Colors.amber,
                        onpress: () {
                          userinput += '+';
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '0',
                        onpress: () {
                          userinput += '0';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '.',
                        onpress: () {
                          userinput += '.';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: 'DEL',
                        onpress: () {
                          userinput =
                              userinput.substring(0, userinput.length - 1);
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '=',
                        color: Colors.amber,
                        onpress: () {
                          equalPress();
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void equalPress() {
    String finaluserinput = userinput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finaluserinput);
    ContextModel contextModel = ContextModel();
    double eva = expression.evaluate(EvaluationType.REAL, contextModel);
    result = eva.toString();
  }
}
