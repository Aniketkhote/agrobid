import 'package:agrobid/utils/firebase_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class UserController extends GetxController {
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
}
