import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget numButton(String btntext, Color btnColor, Color txtColor) {
    return ElevatedButton(
      onPressed: () => {Calculator(btntext)},
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(70, 70), shape: const CircleBorder(), primary: btnColor),
      child: Text(
        btntext,
        style: TextStyle(fontSize: 25, color: txtColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(text,
                        // maxLines: 2,
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.white, fontSize: 80)),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("C", Colors.grey, Colors.black),
                numButton("+/-", Colors.grey, Colors.black),
                numButton("%", Colors.grey, Colors.black),
                numButton("/", Colors.orange, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("7", Colors.grey, Colors.black),
                numButton("8", Colors.grey, Colors.black),
                numButton("9", Colors.grey, Colors.black),
                numButton("*", Colors.orange, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("4", Colors.grey, Colors.black),
                numButton("5", Colors.grey, Colors.black),
                numButton("6", Colors.grey, Colors.black),
                numButton("-", Colors.orange, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("1", Colors.grey, Colors.black),
                numButton("2", Colors.grey, Colors.black),
                numButton("3", Colors.grey, Colors.black),
                numButton("+", Colors.orange, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    text += '0';
                    setState(() {});
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 10, 90, 12),
                    child: Center(
                      child: Text(
                        "0",
                        style: TextStyle(fontSize: 35, color: Colors.black),
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    primary: (Colors.grey),
                  ),
                ),
                numButton(".", Colors.grey, Colors.black),
                numButton("=", Colors.orange, Colors.white)
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  //logic
  int firstNumber = 0;
  int secondNumber = 0;
  String result = "";
  String text = "";
  String operation = "";

  void Calculator(String btntext) {
    if (btntext == "C") {
      result = "";
      text = "";
      firstNumber = 0;
      secondNumber = 0;
    } else if (btntext == "+" ||
        btntext == "-" ||
        btntext == "*" ||
        btntext == "/") {
      firstNumber = int.parse(text);
      result = "";
      operation = btntext;
    } else if (btntext == "=") {
      secondNumber = int.parse(text);
      if (operation == "+") {
        result = (firstNumber + secondNumber).toString();
      }
      if (operation == "-") {
        result = (firstNumber - secondNumber).toString();
      }
      if (operation == "*") {
        result = (firstNumber * secondNumber).toString();
      }
      if (operation == "/") {
        result = (firstNumber / secondNumber).toString();
      }
    } else {
      result = int.parse(text + btntext).toString();
    }

    setState(() {
      text = result;
    });
  }
}
