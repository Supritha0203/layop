import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _firebaseAuthInstance = FirebaseAuth.instance;
  static final String uid = _firebaseAuthInstance.currentUser!.uid;
  static final String name = _firebaseAuthInstance.currentUser!.displayName!;

  static Future<UserCredential> signUp(
      {required String email, required String password}) async {
    return await _firebaseAuthInstance.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  static Future<UserCredential> signIn(
      {required String email, required String password}) async {
    return await _firebaseAuthInstance.signInWithEmailAndPassword(
        email: email, password: password);
  }

  static Future<void> signOut() async {
    return await _firebaseAuthInstance.signOut();
  }
}
