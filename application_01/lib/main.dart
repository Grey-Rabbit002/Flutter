//we ll be using generally material.dart to provide basic theming rather than defining whole by own ...for ios we have cupertino
import 'package:application_01/homepage.dart';
import 'package:application_01/login.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  // print("hi");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // MyApp(Home home);

  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: {
      //   "/": (context) => Home(),
      //   "/login": (context) => Loginpage(),
      // },
      home: Home(),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}
