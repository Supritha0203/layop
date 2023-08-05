import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultscore;
  final Function() resetHandler;

  Result(this.resultscore, this.resetHandler);
  String get resultphase {
    var restext = 'Test Passed';
    String t = resultscore.toString();
    if (resultscore <= 55) {
      restext = 'You might be a slow learner';
    }
    if (resultscore > 55) {
      restext = 'You are not a slow learner';
    }
    return restext;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultphase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text(
              'Restart Quiz!',
            ),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
