// import 'package:application_01/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  void printText() {
    print("this is debug console text ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Panda")),
      drawer: const Drawer(),
      body: Column(
        children: [
          const Text(
            "Anime_List ",
            style: TextStyle(fontSize: 30),
          ),
          ElevatedButton(
              onPressed: () {
                print(
                    "debug text"); //this is achieved by anonymous function and also we can do by defining our function pointer as printText...
              },
              child: const Text("This is a button")),
        ],
      ),
    );
  }
}
