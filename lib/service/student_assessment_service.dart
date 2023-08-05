import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Student PROJECT

class StudentAssessmentService {
  static final FirebaseFirestore _firebaseFirestoreInstance =
      FirebaseFirestore.instance;

  static final String studentEmail = FirebaseAuth.instance.currentUser!.email!;

  static Future<void> updateStudentAssessmentData(
      {required String assessmentID, required num score}) async {
    return await _firebaseFirestoreInstance
        .collection('student')
        .doc(studentEmail)
        .collection('assessments')
        .doc(assessmentID)
        .update({'score': score, 'status': true});
  }
}
