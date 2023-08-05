

import 'package:firebase_auth/firebase_auth.dart';

// Student PROJECT

class StudentAuthService{
  static final FirebaseAuth _firebaseAuthInstance = FirebaseAuth.instance;

  static Future<UserCredential> signIn({required String email, required String password}) async{
    return await _firebaseAuthInstance.signInWithEmailAndPassword(email: email, password: password);
  }

  
}
