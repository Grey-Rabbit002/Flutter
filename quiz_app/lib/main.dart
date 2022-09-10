import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyappState();
  }
}

class MyappState extends State<Myapp> {
  @override
  var questions = [
    {
      'questionText':
          'How often do you share your  feelings with friends or relatives?',
      'answers': [
        {'text': "Never", 'score': 5},
        {'text': "Twice a week", 'score': 13},
        {'text': "once a day", 'score': 20},
        {'text': "twice a month", 'score': 8}
      ]
    },
    {
      'questionText': 'How often do you do kind things for others?',
      'answers': [
        {'text': "Never", 'score': 5},
        {'text': "Twice a week", 'score': 13},
        {'text': "once a day", 'score': 20},
        {'text': "twice a month", 'score': 8}
      ]
    },
    {
      'questionText': 'How much time do you spend on social media per day?',
      'answers': [
        {'text': "Less than 2 hrs", 'score': 20},
        {'text': "2 to 4 hrs", 'score': 15},
        {'text': "4 to 6 hrs", 'score': 10},
        {'text': "more than 6 hrs", 'score': 3}
      ]
    },
    {
      'questionText':
          'I feel that my life is meaningful (i.e. has an important quality or purpose).',
      'answers': [
        {'text': "Never feel this way", 'score': 5},
        {'text': "rarely feel this way", 'score': 8},
        {'text': "often feel this way", 'score': 15},
        {'text': "sometimes feel this way", 'score': 10}
      ]
    },
  ];
  var questionIndex = 0;
  var totalscore = 0;
  void answerQuestion(int score) {
    setState(() {
      if (questionIndex < questions.length) {
        questionIndex += 1;
      }
      totalscore += score;
    });
    print(questionIndex);
  }

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalscore = 0;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Happiness Quiz"),
          ),
          body: questionIndex < questions.length
              ? Quiz(questions, answerQuestion, questionIndex)
              : Result(totalscore, resetQuiz)),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
