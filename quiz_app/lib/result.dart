import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;
  Result(this.resultScore, this.resetQuiz, {super.key});

  String get resultPhrase {
    String resultText = "You did it";
    if (resultScore <= 20) {
      resultText = "good";
    } else if (resultScore <= 30) {
      resultText = "Awesome";
    } else if (resultScore <= 30) {
      resultText = "Awesome";
    } else {
      resultText = "Awesome";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            resultPhrase,
            style: TextStyle(fontSize: 30, letterSpacing: 4),
          ),
        ),
        ElevatedButton(onPressed: resetQuiz, child: Text("Reset Quiz"))
      ],
    );
  }
}
