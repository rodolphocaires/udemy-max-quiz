import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function reset;

  Result({this.score, this.reset});

  String get resultPhrase {
    String resultText;
    if (score <= 8) {
      resultText = 'You\'re awesome and innocent!';
    } else if (score <= 12) {
      resultText = 'Pretty likeble!';
    } else if (score <= 16) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz!',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: reset,
          ),
        ],
      ),
    );
  }
}
