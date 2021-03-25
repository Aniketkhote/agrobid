import 'package:agrobid/models/user_model.dart';
import 'package:agrobid/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

  getUserInfo() async {
    DocumentSnapshot user = await AuthService.fetchUserData();
    UserModel userModel = UserModel();
    userModel.fullname = user["fullname"];
    userModel.email = user["email"];
  }
}
