import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // const Question({super.key});
  final String questionText;
  const Question(this.questionText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(5),
      child: Text(
        questionText,
        style: const TextStyle(
          fontSize: 30,
          letterSpacing: 3,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
