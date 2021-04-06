import 'package:agrobid/utils/firebase_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class UserController extends GetxController {
  TextEditingController changePasswordController = TextEditingController();
  TextEditingController changeEmailController = TextEditingController();
  TextEditingController changePhoneController = TextEditingController();

  RxString _name = "".obs;

  String get name => _name.value;

  @override
  void onInit() {
    _getname();
    super.onInit();
  }

  Future<void> makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _getname() async {
    DocumentSnapshot snapshot = await usersRef.doc(auth.currentUser.uid).get();
    _name.value = snapshot.data()["fullname"];
  }

  changePassword({String newPassword}) async {
    await auth.currentUser.updatePassword(newPassword);
  }

  changeEmail({String newEmail}) async {
    await auth.currentUser.updateEmail(newEmail);
    await usersRef.doc(auth.currentUser.uid).update({
      "email": newEmail,
    });
  }

  changePhone({String newPhone}) async {
    await usersRef.doc(auth.currentUser.uid).update({
      "phone": newPhone,
    });
  }
}
