import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layop2/pages/quiz/json_question_parser.dart';

Widget multipleChoiceQuestionWidget(
    {required Question question,required Function function,required int index,required int selectedVal}) {
  return Container(
    child: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Text(
            question.question,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        ...List.generate(question.answers.length, (i) {
          return RadioListTile(
            title: Text(
              question.answers[i],
            ),
            selectedTileColor: Colors.red,
            activeColor: Colors.black,
            groupValue: selectedVal,
            value: i,
            onChanged: (val) {
              function(val, index);
            },
          );
        }).toList(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                function(-1234567890123411123, index);
              },
              child:const Text(
                'Clear selection',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}
