import 'dart:convert';

class CourseModel {
  final Map<String, List<Map<String,bool>>> courseWork;
  CourseModel({required this.courseWork});

  static Map<String, List<String>> getJSONObject({required String obj}) {
    return jsonDecode(obj);
  }
}
