import 'package:flutter/material.dart';

class CalciPage extends StatefulWidget {
  const CalciPage({super.key});

  @override
  State<CalciPage> createState() => _CalciPageState();
}

class _CalciPageState extends State<CalciPage> {
  double size = 0;
  String input = "";
  String calculated = "";
  String operator = "";
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width / 5;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: Text(
          "Calculator",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 20.0),
            alignment: Alignment.bottomRight,
            child: Text(
              input,
              style: TextStyle(color: Colors.white, fontSize: 70.0),
            ),
          ),
          Row(
            children: [
              Calci("7", Colors.white24),
              Calci("8", Colors.white24),
              Calci("9", Colors.white24),
              Calci("x", Colors.orange),
            ],
          ),
          Row(
            children: [
              Calci("4", Colors.white24),
              Calci("5", Colors.white24),
              Calci("6", Colors.white24),
              Calci("-", Colors.orange),
            ],
          ),
          Row(
            children: [
              Calci("1", Colors.white24),
              Calci("2", Colors.white24),
              Calci("3", Colors.white24),
              Calci("+", Colors.orange),
            ],
          ),
          Row(
            children: [
              Calci("0", Colors.white24),
              Calci(".", Colors.white24),
              Calci("=", Colors.orange),
              Calci("/", Colors.orange),
            ],
          ),
          Calci("Clear", Colors.black54),
        ],
      ),
    );
  }

  Widget Calci(String text, Color bgcolor) {
    return InkWell(
      onTap: () {
        if (text == "Clear") {
          setState(() {
            input = "";
          });
        } else if (text == "+" || text == "-" || text == "x" || text == "/") {
          setState(() {
            calculated = input;
            input = "";
            operator = text;
          });
        } else if (text == "=") {
          setState(() {
            double calc = double.parse(calculated);
            double inp = double.parse(input);

            if (operator == "+") {
              input = (calc + inp).toString();
            } else if (operator == "-") {
              input = (calc - inp).toString();
            } else if (operator == "x") {
              input = (calc * inp).toString();
            } else if (operator == "/") {
              input = (calc / inp).toString();
            }
          });
        } else {
          setState(() {
            input = input + text;
          });
        }
      },
      child: Container(
        height: size,
        width: size,
        margin: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: bgcolor),
      ),
    );
  }
}
