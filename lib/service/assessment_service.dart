import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:layop2/models/assessment_model.dart';
import 'package:layop2/service/auth_service.dart';

class AssessmentService {
  static final FirebaseFirestore _firebaseFirestoreInstance =
      FirebaseFirestore.instance;

  static Future<void> createAssessment(
      {required String uid,
      required String topicName,
      required AssessmentModel assessmentModel}) async {
    String topicID = _firebaseFirestoreInstance.collection('assessment').id;
    return await _firebaseFirestoreInstance
        .collection('assessment')
        .doc(uid)
        .collection(topicName)
        .doc(topicID)
        .set({
      ...assessmentModel.toJson(),
      'topicName': topicName
    });
  }

  static Future<void> updateAssessment(
      {required String uid,
      required String topicID,
      required String topicName,
      required AssessmentModel assessmentModel}) async {
    return await _firebaseFirestoreInstance
        .collection('assessment')
        .doc(uid)
        .collection(topicName)
        .doc(topicID)
        .update(assessmentModel.toJson());
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> readOneAssessment(
      {required String uid,
      required String topicID,
      required String topicName}) async {
    return await _firebaseFirestoreInstance
        .collection('assessment')
        .doc(uid)
        .collection(topicName)
        .doc(topicID)
        .get();
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> readAllTopicAssessment(
      {required String uid, required String topicName}) async {
    return await _firebaseFirestoreInstance
        .collection('assessment')
        .doc(uid)
        .collection(topicName)
        .get();
  }

  static Future<void> sendTestsToStudents(
      {required List<String> emails,
      required String topicID,
      required String topicName,
      required String methodology,
      required String assignedDate}) async {
        String uid = AuthService.uid;
    return await Future.forEach(emails, (email) async {

      String assessmentID= _firebaseFirestoreInstance.collection('assessment').id;
      await _firebaseFirestoreInstance
          .collection('student')
          .doc(email)
          .collection('assessments')
          .doc(assessmentID)
          .set({
        'topicID': topicID,
        'topicName': topicName,
        'status': false,
        'score': 0,
        'methodology': methodology,
        'assignedDate': assignedDate,
        'studentEmail': email,
        'teacherUID': uid,
        'assessmentID': assessmentID
      });
    });
  }

  static Future<List<Map<String, dynamic>>> getHistoryOfStudentByDate(
      {required List<String> emails, required String assignedDate}) async {
    List<Map<String, dynamic>> history = [];
    await Future.forEach(emails, (email) async {
      String uid = AuthService.uid;
      QuerySnapshot<Map<String, dynamic>> doc = await _firebaseFirestoreInstance
          .collection('student')
          .doc(email)
          .collection('assessments')
          .where('assignedDate', isEqualTo: assignedDate)
          .where('teacherUID', isEqualTo: uid)
          .get();
      for (var element in doc.docs) {
        history.add(element.data());
      }
    });
    return history;
  }
}
