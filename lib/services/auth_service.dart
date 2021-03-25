import 'package:agrobid/models/user_model.dart';
import 'package:agrobid/utils/firebase_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  static Future<void> storeUserData(UserModel user) async {
    await users.doc(auth.currentUser.uid).set({
      "fullname": user.fullname,
      "email": user.email,
      "phone": user.phone,
    });
  }

  static Future<DocumentSnapshot> fetchUserData() async {
    CollectionReference userCollection = users;
    Future<DocumentSnapshot> user =
        userCollection.doc(auth.currentUser.uid).get();
    return user;
  }
}
