import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:layop2/models/user_model.dart';

class CreateUserService {
  static final FirebaseFirestore _firebaseFirestoreInstance =
      FirebaseFirestore.instance;

  static Future<void> addUserDetailsInDB(
      {required UserCredential userCredential,
      required UserModel userModel}) async {
    return await _firebaseFirestoreInstance
        .collection('users')
        .doc(userCredential.user!.uid)
        .set({'studentsUID': [], 'parentsUID': [], ...userModel.toJson()});
  }

  static Future<void> updateUserDetailsInDB(
      {required UserCredential uid, required UserModel userModel}) async {
    return await _firebaseFirestoreInstance
        .collection('users')
        .doc(userModel.uid)
        .update(userModel.toJson());
  }
}
