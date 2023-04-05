import 'package:flutter/material.dart';

import '../Utils/routes.dart';

class LoginPage extends StatefulWidget {
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
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changebtn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Material(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Image.asset(
                    "assets/images/login_img.png",
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Welcome $name",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 22.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Enter Username",
                              labelText: "Username"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Username can't be empty";
                            }

                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              labelText: "Password"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password can't be empty";
                            } else if (value.length < 6) {
                              return "Password length is insufficient";
                            }

                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Material(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(changebtn ? 50 : 8),
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changebtn ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changebtn
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text("Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
