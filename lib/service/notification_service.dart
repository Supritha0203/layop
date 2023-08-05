import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationService {
  static final FirebaseFirestore _firebaseFirestoreInstance =
      FirebaseFirestore.instance;

  static Future<void> createNotification(
      {required String fromUID,
      required String toUID,
      required String message}) async {
    String notificationID =
        _firebaseFirestoreInstance.collection('notification').id;
    return await _firebaseFirestoreInstance
        .collection('notifications')
        .doc(notificationID)
        .set({
      'fromUID': fromUID,
      'message': message,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'isRead': false,
    });
  }

  static Future<void> updateNotification(
      {required String notificationID}) async {
    return await _firebaseFirestoreInstance
        .collection('notifications')
        .doc(notificationID)
        .update({'isRead': true});
  }
}
