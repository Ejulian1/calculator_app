import 'package:flutter/material.dart';
import 'package:calculator_app/widget/button.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;
  int firstnum = 0;
  int lastnum = 0;
  String history = "";
  String res = "";
  String operation = "";
  String textToDisplay = "";

  void btnClick(String btnval) {
    print(btnval);

    if (btnval == 'C') {
      setState(() {
        textToDisplay = '';
        firstnum = 0;
        lastnum = 0;
        res = '';
      });
    } else if (btnval == 'AC') {
      setState(() {
        textToDisplay = '';
        firstnum = 0;
        lastnum = 0;
        res = '';
        history = '';
      });
    } else if (btnval == '+/-') {
      if (textToDisplay[0] != '-') {
        res = '-' + textToDisplay;
      } else {
        res = textToDisplay.substring(1);
      }
    } else if (btnval == '<') {
      res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btnval == '+' ||
        btnval == '-' ||
        btnval == 'X' ||
        btnval == '/') {
      firstnum = int.parse(textToDisplay);
      res = '';
      operation = btnval;
    } else if (btnval == '=') {
      lastnum = int.parse(textToDisplay);

      if (operation == '+') {
        res = (firstnum + lastnum).toString();
        history = firstnum.toString() + operation + lastnum.toString();
      }
      if (operation == '-') {
        res = (firstnum - lastnum).toString();
        history = firstnum.toString() + operation + lastnum.toString();
      }
      if (operation == 'X') {
        res = (firstnum * lastnum).toString();
        history = firstnum.toString() + operation + lastnum.toString();
      }
      if (operation == '/') {
        res = (firstnum / lastnum).toString();
        history = firstnum.toString() + operation + lastnum.toString();
      }
    } else {
      res = int.parse(textToDisplay + btnval).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    const lightBg = Color.fromARGB(255, 255, 241, 247);
    const lightNumBtn = Color.fromARGB(255, 231, 117, 165);
    const lightOpBtn = Color.fromARGB(255, 155, 28, 81);
    const lightEqBtn = Color.fromARGB(255, 167, 16, 66);
    const lightHistoryText = Color.fromARGB(255, 204, 136, 170);
    const lightDisplayText = Color.fromARGB(255, 110, 12, 61);

    const darkBg = Color.fromARGB(255, 12, 16, 28);
    const darkNumBtn = Color.fromARGB(255, 93, 29, 68);
    const darkOpBtn = Color.fromARGB(255, 186, 30, 102);
    const darkEqBtn = Color.fromARGB(255, 236, 72, 153);
    const darkHistoryText = Color.fromARGB(255, 203, 213, 225);
    const darkDisplayText = Color.fromARGB(255, 249, 250, 251);

    final bg = isDark ? darkBg : lightBg;
    final numBtn = isDark ? darkNumBtn : lightNumBtn;
    final opBtn = isDark ? darkOpBtn : lightOpBtn;
    final eqBtn = isDark ? darkEqBtn : lightEqBtn;
    final historyTextColor = isDark ? darkHistoryText : lightHistoryText;
    final displayTextColor = isDark ? darkDisplayText : lightDisplayText;

    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 173, 92, 130),
        ),
      ),
        home: Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: Text(
       'Calculator App',
        style: TextStyle(
        color: Colors.pink[600],
        fontSize: 20,
        fontWeight: FontWeight.w500,
        ),
    ),
    actions: [
      IconButton(
        icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
        onPressed: () {
          setState(() {
            isDark = !isDark;
          });
        },
      ),
    ],
  ),
        body: Container(
          color: bg,
          margin: const EdgeInsets.all(1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(
                      history,
                      style: TextStyle(
                        color:historyTextColor,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    textToDisplay,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 110, 12, 61),
                      fontSize: 48,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalButton(
                    text: "AC",
                    fillColor: opBtn,
                    textColor: Colors.white,
                    textSize: 16,
                    callback: btnClick,
                  ),
                  CalButton(
                    text: "C",
                    fillColor: opBtn,
                    textColor: Colors.white,
                    textSize: 24,
                    callback: btnClick,
                  ),
                  CalButton(
                    text: "<",
                    fillColor:opBtn,
                    textColor: Colors.white,
                    textSize: 24,
                    callback: btnClick,
                  ),
                  CalButton(
                    text: "/",
                    fillColor:opBtn,
                    textColor: Colors.white,
                    textSize: 24,
                    callback: btnClick,
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalButton(
                    text: "9",
                    fillColor: numBtn,
                    textColor: Colors.white,
                    textSize: 24,
                    callback: btnClick,
                  ),
                  CalButton(
                    text: "8",
                    fillColor: numBtn,
                    textColor: Colors.white,
                    textSize: 24,
                    callback: btnClick,
                  ),
                  CalButton(
                    text: "7",
                    fillColor:numBtn,
                    textColor: Colors.white,
                    textSize: 24,
                    callback: btnClick,
                  ),
                  CalButton(
                    text: "X",
                    fillColor: opBtn,
                    textColor: Colors.white,
                    textSize: 24,
                    callback: btnClick,
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalButton(
                    text: "6",
                    fillColor:numBtn,
                    textColor: Colors.white,
                    textSize: 24,
                    callback: btnClick,
                  ),
                  CalButton(
                    text: "5",
                    fillColor: numBtn,
                    textColor: Colors.white,
                    textSize: 24,
                    callback: btnClick,
                  ),
                  CalButton(
                    text: "4",
                    fillColor: numBtn,
                    textColor: Colors.white,
                    textSize: 24,
                    callback: btnClick,
                  ),
                  CalButton(
                    text: "-",
                    fillColor: opBtn,
                    textColor: Colors.white,
                    textSize: 24,
                    callback: btnClick,
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalButton(
                    text: "3",
                    fillColor: numBtn,
                    textColor: Colors.white,
                    textSize: 24,
                    callback: btnClick,
                  ),
                  CalButton(
                    text: "2",
                    fillColor: numBtn,
                    textColor: Colors.white,
                    textSize: 24,
                    callback: btnClick,
                  ),
                  CalButton(
                    text: "1",
                    fillColor:numBtn,
                    textColor: Colors.white,
                    textSize: 24,
                    callback: btnClick,
                  ),
                  CalButton(
                    text: "+",
                    fillColor: opBtn,
                    textColor: Colors.white,
                    textSize: 24,
                    callback: btnClick,
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalButton(
                    text: "+/-",
                    fillColor:numBtn,
                    textColor: Colors.white,
                    textSize: 16,
                    callback: btnClick,
                  ),
                  CalButton(
                    text: "0",
                    fillColor: numBtn,
                    textColor: Colors.white,
                    textSize: 24,
                    callback: btnClick,
                  ),
                  CalButton(
                    text: "00",
                    fillColor: numBtn,
                    textColor: Colors.white,
                    textSize: 19,
                    callback: btnClick,
                  ),
                  CalButton(
                    text: "=",
                    fillColor: const Color.fromARGB(255, 167, 16, 66),
                    textColor: Colors.white,
                    textSize: 24,
                    callback: btnClick,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
