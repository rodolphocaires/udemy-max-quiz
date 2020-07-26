import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int index;
  final Function onPressed;

  Quiz({
    @required this.questions,
    @required this.index,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[index]['text']),
        ...(questions[index]['answers'] as List<Map<String, Object>>).map((_answer) {
          return Answer(text: _answer['text'], onPressed: () => onPressed(_answer['score']));
        }).toList()
      ],
    );
  }
}
