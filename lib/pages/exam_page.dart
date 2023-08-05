import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:layop2/models/quiz_model.dart';
import 'package:layop2/util/app_constant.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<QuizModel> quiz = [
    QuizModel(question: 'What is the capital of India?', options: [
          "New Delhi",
          "Mumbai",
          "Kolkata",
          "Chennai",
        ], answer: 0),
    QuizModel(question: 'What is 2 + 2', options: ['4', '5', '6','7'], answer: 0),
   QuizModel(
        question: 'What is the capital of India?',
        options: [
          "New Delhi",
          "Mumbai",
          "Kolkata",
          "Chennai",
        ],
        answer: 0),
    QuizModel(
        question: 'What is 2 + 2', options: ['4', '5', '6', '7'], answer: 0),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Exam"),
          actions: [],
        ),
        body: ListView.builder(
          itemBuilder: (ctx, ind) {
            List<Widget> options = [];

            for (var i = 0; i < quiz[ind].options.length; i++) {
              options.add(RadioListTile(
                  title: Text(quiz[ind].options[i]),
                  value: quiz[ind].options[i],
                  groupValue: '',
                  onChanged: (val) {
                    log(val.toString());
                  }));
            }
            return Card(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(quiz[ind].question), ...options],
                ),
              ),
            );
          },
          itemCount: quiz.length,
        ));
  }
}
