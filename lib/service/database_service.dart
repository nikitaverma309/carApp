import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../healper/app_helper.dart';

class DataBaseService {
  static const String _userCollection = "users";

  static FirebaseFirestore _db = FirebaseFirestore.instance;

  /// --------------------------Set user record ------------------------------
  static Future<void> setUser({
    required String name,
     required String email,
    required String uid,
  }) async {

    try {
      String? fcmToken = await FirebaseMessaging.instance.getToken();
      await _db.collection(_userCollection).doc(uid).set({
        "name": name,
        "email": email,
        "fcm_token": fcmToken,
      });
    } catch (e) {
      AppHelper.logger.e(e.toString());
    }
  }

  ///--------------------------Get user record user------------------------
 static Future<DocumentSnapshot> getUser({required String uid}) {
    return _db.collection(_userCollection).doc(uid).get();
  }


  ///--------------------------Delete user account------------------------

  static Future deleteFirebaseDataBase({required String uid}) async {
    await _db.collection(_userCollection).doc(uid).delete();
  }

  ///------------------------ Reset user progress ------------------------

  static Future resetUserProgress(
      {required String uid}) async {
    await _db
        .collection(_userCollection)
        .doc(uid)
        .set({"workout_data": ""});
  }

}


