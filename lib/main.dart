import 'package:calculator/Pages/login.dart';
import 'package:flutter/material.dart';
import 'Pages/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Utils/routes.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: GoogleFonts.lato().fontFamily,
        inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.orange, fontSize: 22),
            focusColor: Colors.white54),
      ),
      // darkTheme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage()
      },
    );
  }
}
