
import 'dart:convert';

class QuizModel{
  final String question;
  final List<String> options;
  final int answer;

  QuizModel({required this.question, required this.options, required this.answer});

  Map<String,dynamic> toJson()=>{
    'question':question,
    'options':options,
    'answer':answer,
  };

  static getJsonString(QuizModel quizModel){
    return jsonEncode(quizModel);
  } 
}