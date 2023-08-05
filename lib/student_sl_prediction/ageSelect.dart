import 'package:flutter/material.dart';
import 'package:layop2/student_sl_prediction/quiz.dart';

import '../student_sl_prediction/data.dart';
import '../student_sl_prediction/result.dart';
// void main() {
//   runApp(MyApp());
// }


class AgeSelect extends StatefulWidget {
  const AgeSelect({required Key key}) : super(key: key);

  @override
  State<AgeSelect> createState() => _AgeSelectState();
}

class _AgeSelectState extends State<AgeSelect> {
  List<String> ages = ['5', '6', '7', '8', '9', '10', '11', '12']; // Option 2
  late String _selectedLocation; // Option 2

  List<Map<String, dynamic>> iqData = [];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
      print(_questionIndex);
      if (_questionIndex < iqData.length) {
        print('We have more questions!');
      } else {
        print('No more questions!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: ListView(children: [
        Center(
          child: DropdownButton(
            hint: Text('Please choose your age'), // Not necessary for Option 1
            value: _selectedLocation,
            onChanged: (newValue) {
              setState(() {
                _selectedLocation = newValue!;
                if (_selectedLocation == '5' || _selectedLocation == '6') {
                  iqData = Data.questionsFiveAndSix;
                } else if (_selectedLocation == '7' ||
                    _selectedLocation == '8') {
                  iqData = Data.questionsSevenAndEight;
                } else if (_selectedLocation == '9' ||
                    _selectedLocation == '10') {
                  iqData = Data.questionsNineAndTen;
                }
              });
            },
            items: ages.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        if (iqData.length > 0)
          _questionIndex < iqData.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: iqData,
                )
              : Result(_totalScore, _resetQuiz),
      ])),
    );
  }
}
