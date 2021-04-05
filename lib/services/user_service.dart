import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';
import '../utils/firebase_constant.dart';

class UserService {
  static void storeUserData(UserModel user) async {
    await usersRef.doc(auth.currentUser.uid).set({
      "id": auth.currentUser.uid,
      "fullname": user.fullname,
      "email": user.email,
      "phone": user.phone,
    });
  }

  fetchUserData() async {
    DocumentSnapshot doc = await usersRef.doc(auth.currentUser.uid).get();
    return UserModel.fromDocumentSnapshot(doc);
  }
}
