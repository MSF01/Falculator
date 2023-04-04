import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String devName = "Shayaan";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Center(
        child: Text("Scientific Calculator by $devName"),
      ),
      drawer: const Drawer(),
    );
  }
}
