// import 'package:application_01/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  // const Home({super.key});

  // const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Panda")),
      drawer: const Drawer(),
      body: Center(
          child: Container(
        child: const Text(
          "Jujutsu Kaisen",
          style: TextStyle(
            fontSize: 40,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      )),
    );
  }
}
