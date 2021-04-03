import 'package:agrobid/models/user_model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  Rx<UserModel> _userModel = UserModel().obs;

  UserModel get user => _userModel.value;

  set user(UserModel user) => this._userModel.value = user;

  void get clear => _userModel.value = UserModel();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
