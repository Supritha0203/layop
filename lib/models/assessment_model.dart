

import 'dart:convert';

import 'package:layop2/models/quiz_model.dart';

class AssessmentModel{
  List<QuizModel> quiz;
  String methodology;
  String physicalPrompt;
  String verbalPrompt;
  String tlm;
  AssessmentModel({required this.quiz,required this.methodology,required this.physicalPrompt,required this.verbalPrompt,required this.tlm});

  Map<String,dynamic> toJson()=>{
    'quiz':quiz.map((e) => e.toJson()).toList(),
    'methodology':methodology,
    'physicalPrompt':physicalPrompt,
    'verbalPrompt':verbalPrompt,
    'tlm':tlm,
    
  };

  static getAssessmentString(AssessmentModel assessmentModel){
    return jsonEncode(assessmentModel);
  }

  static getAssessmentJSON(String assessment){
    return jsonDecode(assessment);
  }
}
