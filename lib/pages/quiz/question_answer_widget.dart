import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layop2/pages/quiz/json_question_parser.dart';

Widget questionAnswerWidget({
  required Question question,
  required dynamic answer,
  required int qNumber,
}) {
  return Container(
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Question $qNumber',
              style: TextStyle(
                color: Colors.blueGrey,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (question.type == 0 || question.type == 1)
                      ? 'Multiple choice'
                      : question.type == 2
                          ? 'True or False'
                          : question.type == 3
                              ? 'Fill in blanks'
                              : '',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  '1 Pts',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.blueGrey,
                  ),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          question.question,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        if (question.type == 3)
          Text(
            '${question.correctIndex[0]}',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        ...List.generate(question.answers.length, (index) {
          return Column(
            children: [
              Text(
                '${index + 1}) ${question.answers[index]}',
                style: TextStyle(
                  color: question.correctIndex.contains(index)
                      ? Colors.green
                      : Colors.black,
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          );
        }),
        SizedBox(
          height: 10,
        ),
        Text(
          'Your Answer',
          style: TextStyle(
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        question.type == 0
            ? //multiple ch
            multiple(question: question, answer: answer)
            : question.type == 1
                ? //mul with more than one
                multipleTwo(answer: answer, question: question)
                : question.type == 2
                    ? //true orfalse
                    multiple(question: question, answer: answer)
                    : fillInblanks(
                        answer: answer, question: question) // fill in blanks
      ],
    ),
  );
}

Widget multiple({required Question question, dynamic answer}) {
  if (answer == -1234567890123411123) {
    return Text(
      'Unanswered',
      style: TextStyle(
        color: Colors.deepOrange,
      ),
    );
  }
  return Text(
    '${question.answers[answer]}',
    style: TextStyle(
      color: answer == question.correctIndex[0] ? Colors.green : Colors.red,
    ),
  );
}

Widget multipleTwo({required Question question, required List answer}) {
  if (answer.any((element) => element != -1234567890123411123)) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ...List.generate(answer.length, (i) {
        if (answer[i] != -1234567890123411123) {
          return Text(
            question.answers[answer[i]],
            style: TextStyle(
              color: question.correctIndex.contains(answer[i])
                  ? Colors.green
                  : Colors.red,
            ),
          );
        }
        return Container();
      }),
      SizedBox(
        height: 5,
      ),
      Text(
        'All options must be same',
        style: TextStyle(
          color: Colors.blueGrey,
          fontSize: 10,
        ),
      )
    ]);
  }
  return Text(
    'Unanswered',
    style: TextStyle(
      color: Colors.deepOrange,
    ),
  );
}

Widget fillInblanks({required Question question, dynamic answer}) {
  if (answer == -1234567890123411123) {
    return Text(
      'Unanswered',
      style: TextStyle(
        color: Colors.deepOrange,
      ),
    );
  }

  return Text(
    '$answer',
    style: TextStyle(
      color: answer == question.correctIndex[0] ? Colors.green : Colors.red,
    ),
  );
}
