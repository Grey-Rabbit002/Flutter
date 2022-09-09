import 'package:flutter/material.dart';

void main() {
  runApp(Loginpage());
}

class Loginpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Material(
      child: Center(
        child: Container(
          child: const Text("basic login pretext"),
        ),
      ),
    ));
  }
}
