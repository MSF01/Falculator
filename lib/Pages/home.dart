import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
                      child: SizedBox(
                        // padding: const EdgeInsets.all(10.0),
                        child: AutoSizeText(
                          "$text",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 100),
                          maxLines: 1,
                          overflowReplacement:
                              const Text('Sorry String too long'),
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
                  onPressed: () {
                    setState(() {
                      text = text + "0";
                    });
                  },
                  child: const Text(
                    '0',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(25),
                      backgroundColor: Colors.grey[850],
                      shape: const CircleBorder()),
                  onPressed: () {
                    setState(() {
                      text = text + ".";
                    });
                  },
                  child: const Text(
                    '.',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
                // calc('.', Colors.grey[850]!, Colors.white, 34),
                calc('=', Colors.amber[700]!, Colors.white, 24),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // The main algorithm

  dynamic text = '';

  dynamic numone = 0;
  dynamic numtwo = 0;

  // late double dnumone = numone.toDouble();

  bool hasdecimal = false;

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
      if (text.contains('.')) {
        numone = double.parse(text);
      } else {
        numone = int.parse(text);
      }

      result = '';
      operation = btntext;
    } else if (btntext == "=") {
      if (text.contains('.')) {
        numtwo = double.parse(text);
      } else {
        numtwo = int.parse(text);
      }
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
    } else if (text.contains('.')) {
      result = double.parse(text + btntext).toString();
    } else {
      result = int.parse(text + btntext).toString();
    }

    setState(() {
      text = result;
    });
  }
}
