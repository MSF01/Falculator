import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget calc(String txt, Color bg, Color ctxt, double ftsize) {
    return ElevatedButton(
      onPressed: () {
        calculate(txt);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: bg,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(25),
      ),
      child: Text(
        txt,
        style: TextStyle(
            fontSize: ftsize,
            color: ctxt,
            fontFamily: GoogleFonts.lato().fontFamily,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: const Text("Falculator"),
        backgroundColor: Colors.black38,
        foregroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        titleTextStyle: TextStyle(
            fontSize: 24,
            fontFamily: GoogleFonts.lato().fontFamily,
            fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 1,
                    child: Transform.scale(
                      scale: 0.8,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "$text",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 100),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calc("AC", Colors.grey, Colors.black, 18),
                calc("+/-", Colors.grey, Colors.black, 18),
                calc("%", Colors.grey, Colors.black, 24),
                calc("/", Colors.orange, Colors.white, 24),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calc("7", Colors.grey[850]!, Colors.white, 34),
                calc("8", Colors.grey[850]!, Colors.white, 34),
                calc("9", Colors.grey[850]!, Colors.white, 34),
                calc("X", Colors.orange, Colors.white, 24),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calc("4", Colors.grey[850]!, Colors.white, 34),
                calc("5", Colors.grey[850]!, Colors.white, 34),
                calc("6", Colors.grey[850]!, Colors.white, 34),
                calc("-", Colors.orange, Colors.white, 26),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calc("1", Colors.grey[850]!, Colors.white, 34),
                calc("2", Colors.grey[850]!, Colors.white, 34),
                calc("3", Colors.grey[850]!, Colors.white, 34),
                calc("+", Colors.orange, Colors.white, 24),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(34, 20, 123, 20),
                      backgroundColor: Colors.grey[850],
                      shape: const StadiumBorder()),
                  onPressed: () {},
                  child: const Text(
                    '0',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
                calc('.', Colors.grey[850]!, Colors.white, 34),
                calc('=', Colors.amber[700]!, Colors.white, 24),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  dynamic text = '';
  int numone = 0;
  int numtwo = 0;

  dynamic result = '';
  dynamic operation = '';

  void calculate(String btntext) {
    if (btntext == "AC") {
      text = '';
      numone = 0;
      numtwo = 0;
      result = '';
    } else if (btntext == "+" ||
        btntext == "-" ||
        btntext == "X" ||
        btntext == "/" ||
        btntext == "%") {
      numone = int.parse(text);
      // if (numone == null) {
      //   print("The value is not a integer");
      // }
      result = "";
      operation = btntext;
    } else if (btntext == "=") {
      numtwo = int.parse(text);
      if (operation == "+") {
        result = (numone + numtwo).toString();
      }
      if (operation == "-") {
        result = (numone - numtwo).toString();
      }
      if (operation == "X") {
        result = (numone * numtwo).toString();
      }
      if (operation == "/") {
        result = (numone / numtwo).toString();
      }
      if (operation == "%") {
        result = (numone % numtwo).toString();
      }
    } else if (btntext == "+/-") {
      text.toString().startsWith('-')
          ? text = result.toString().substring(1)
          : text = '-' + text.toString();
      result = text;
    } else if (btntext == ".") {
      text = result.toString() + '.';
      result = text;
    } else if (btntext == "0") {
      text = result.toString() + '0';
      result = text;
    } else {
      result = int.parse(text + btntext).toString();
    }

    setState(() {
      text = result;
    });
  }
}
