import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "AC") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "×" ||
        buttonText == "÷" ||
        buttonText == "%") {
      // Added modulus operator
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      } else if (operand == "-") {
        _output = (num1 - num2).toString();
      } else if (operand == "×") {
        _output = (num1 * num2).toString();
      } else if (operand == "÷") {
        _output = (num1 / num2).toString();
      } else if (operand == "%") {
        _output = (num1 % num2).toString(); // Modulus calculation
      }

      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2).replaceAll(".00", "");
    });
  }

  Widget buildButton(String buttonText, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20.0),
          shape: CircleBorder(),
          backgroundColor: color,
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 30.0),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              output,
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildButton("AC", Colors.grey),
                    buildButton("÷", Colors.orange),
                    buildButton("%", Colors.orange), // Modulus operator
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildButton("7", Colors.black54),
                    buildButton("8", Colors.black54),
                    buildButton("9", Colors.black54),
                    buildButton("×", Colors.orange),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildButton("4", Colors.black54),
                    buildButton("5", Colors.black54),
                    buildButton("6", Colors.black54),
                    buildButton("-", Colors.orange),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildButton("1", Colors.black54),
                    buildButton("2", Colors.black54),
                    buildButton("3", Colors.black54),
                    buildButton("+", Colors.orange),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildButton("0", Colors.black54),
                    buildButton(".", Colors.black54),
                    buildButton("=", Colors.orange),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
