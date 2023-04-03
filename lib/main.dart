import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  Calculator({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
