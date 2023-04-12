import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changebtn = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changebtn = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changebtn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
              // color: Colors.black,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 160.0,
                    ),
                    // Image.asset(
                    //   "assets/images/login_img.png",
                    //   fit: BoxFit.cover,
                    // ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Welcome $name",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 22.0),
                      child: Column(
                        children: [
                          TextFormField(
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: GoogleFonts.lato().fontFamily,
                                fontSize: 24),
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange)),
                              labelText: "Username",
                            ),
                            validator: (uservalue) {
                              if (uservalue != "Admin") {
                                return "Invalid Username";
                              }
                              if (uservalue!.isEmpty) {
                                return "Username can't be empty";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              name = value;
                              setState(() {});
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: GoogleFonts.lato().fontFamily,
                                fontSize: 24),
                            obscureText: true,
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange)),
                                labelText: "Password"),
                            validator: (pwdvalue) {
                              if (pwdvalue != "root") {
                                return "Invalid Password";
                              } else if (pwdvalue!.isEmpty) {
                                return "Password can't be empty";
                              } else if (pwdvalue.length < 4) {
                                return "Password length is insufficient";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Material(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(changebtn ? 50 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          width: changebtn ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changebtn
                              ? const Icon(
                                  Icons.done,
                                  color: Colors.black,
                                )
                              : const Text("Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
