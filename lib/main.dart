import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/question.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'text': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Blue', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'Yellow', 'score': 1}
      ],
    },
    {
      'text': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Cat', 'score': 5},
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Dog', 'score': 1},
        {'text': 'Elephant', 'score': 10}
      ]
    },
    {
      'text': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Maximillian', 'score': 1},
        {'text': 'Sandra Lee', 'score': 3},
        {'text': 'Brasileirinho Badaras', 'score': 10},
        {'text': 'Italiano Maluuunco', 'score': 5}
      ]
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex < _questions.length) {
      setState(() => _questionIndex++);
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
    });
    _totalScore = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                index: _questionIndex,
                onPressed: _answerQuestion,
              )
            : Result(
                score: _totalScore,
                reset: _resetQuiz,
              ),
      ),
    );
  }
}
