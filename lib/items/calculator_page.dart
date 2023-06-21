import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _expression = '';
  String _result = '';

  void _updateExpression(String value) {
    setState(() {
      _expression += value;
    });
  }

  void _calculateResult() {
    setState(() {
      try {
        _result = evalExpression(_expression).toString();
      } catch (e) {
        _result = 'Error';
      }
    });
  }

  double evalExpression(String expression) {
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    return exp.evaluate(EvaluationType.REAL, cm);
  }

  void _clear() {
    setState(() {
      _expression = '';
      _result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Calculator'),
      ),
      body: Column(children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(9),
            alignment: Alignment.bottomRight,
            child: Text(
              _expression,
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(9),
            alignment: Alignment.bottomRight,
            child: Text(
              _result,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          flex: 6,
            child: Column(
          children: [
            buildButtonRow(['7', '8', '9', '/']),
            buildButtonRow(['4', '5', '6', '*']),
            buildButtonRow(['3', '2', '1', '+']),
            buildButtonRow(['.', '0', '=', '-']),
            buildButtonRow(['C']),
          ],
        ))
      ]),
    );
  }

  Widget buildButtonRow(List<String> buttons) {
    return Expanded(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buttons
                .map((button) => buildButton(
                    buttonText: button,
                    buttonColor: Colors.white,
                    textColor: Colors.black,
                    onTap: () {
                      if (button == 'C') {
                        _clear();
                      } else if (button == '=') {
                        _calculateResult();
                      } else {
                        _updateExpression(button);
                      }
                    }))
                .toList()));
  }

  Widget buildButton({
    required String buttonText,
    required Color textColor,
    required Color buttonColor,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple[200],
            border: Border.all(color: Colors.black87),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 24, color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
