import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String devName = "Shayaan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Center(
        child: Container(
          child: Text("Scientific Calculator by $devName"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
