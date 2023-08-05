import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:layop2/pages/quiz/json_question_parser.dart';
import 'package:layop2/pages/quiz/question_answer_widget.dart';

class FinalAnswersRevelaPage extends StatefulWidget {
  static const routeName =
      '/signin-signup/upcommingexam/exam/attempt/answersreveal';

  const FinalAnswersRevelaPage({super.key});

  @override
  _FinalAnswersRevelaPageState createState() => _FinalAnswersRevelaPageState();
}

class _FinalAnswersRevelaPageState extends State<FinalAnswersRevelaPage> {
  late List<dynamic> answers;
  late JsonQuestionParser jsonQuestionParser;
  late String id;
  int total = 0, answerd = 0, correct = 0;

  findInsights() {
    total = jsonQuestionParser.questions.length;
    for (var i = 0; i < answers.length; i++) {
      if (answers[i] is List) {
        if (answers[i].any((e) => e != -1234567890123411123)) {
          answerd++;
          List l = answers[i];
          l.removeWhere((element) => element == -1234567890123411123);
          if (listEquals(l, jsonQuestionParser.questions[i].correctIndex)) {
            correct++;
          }
        }
      } else {
        if (answers[i] != -1234567890123411123) {
          answerd++;
          if (answers[i] == jsonQuestionParser.questions[i].correctIndex[0]) {
            correct++;
          }
        }
      }
    }
  }

  int i = 0;

  void addHistoryOfStudent(
      {required String id,
      required String data,
      required List<dynamic> selectedItems,
      required int total,
      required int answerd,
      required int correct}) async {
    try {
      final email = FirebaseAuth.instance.currentUser!.email;
      await FirebaseFirestore.instance
          .collection('student')
          .doc(email)
          .collection('history')
          .doc(id)
          .set({
        'assessment': data,
        'time': DateTime.now().toString(),
        'score': 0,
        'id': id,
        'selectedItems': json.encode(selectedItems),
        'total': total,
        'answerd': answerd,
        'correct': correct,
      });
    } catch (e) {
      print(e);
    }
  }

  // bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    Map<String, Object> modalRoute =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    answers = modalRoute['answers'] as List<dynamic>;
    jsonQuestionParser = modalRoute['data'] as JsonQuestionParser;
    id = modalRoute['id'] as String;
    if (i == 0) {
      findInsights();
      setState(() {
        i++;
      });
      
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Review answers',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (_, index) {
            if (index == 0) {
              return Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(25),
                // decoration: BoxDecoration(
                //   border: Border.all(
                //     color: Colors.blueGrey[100],
                //   ),
                //   borderRadius: BorderRadius.circular(10),
                // ),
                child: const Text(
                  '''Thank you for taking the test. Check out your dashboard for your score and live leaderboard ranking to know where you stand. Come back soon for another mock test.\n\nHappy Learning:)''',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                    color: Colors.blueGrey,
                    letterSpacing: 0.8,
                  ),
                  softWrap: true,
                ),
              );
            }
            return questionAnswerWidget(
              question: jsonQuestionParser.questions[index - 1],
              answer: answers[index - 1],
              qNumber: index,
            );
          },
          separatorBuilder: (_, ind) {
            return Divider(
              color: Colors.blueGrey[100],
            );
          },
          itemCount: jsonQuestionParser.questions.length + 1),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.black,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total : $total',
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 10,
                  ),
                ),
                Text(
                  'Answerd : $answerd',
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 10,
                  ),
                ),
                Text(
                  'Correct : $correct',
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Finish review',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
