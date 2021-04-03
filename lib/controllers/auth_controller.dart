import 'package:agrobid/pages/app_layout.dart';
import 'package:agrobid/pages/auth_screen/login_screen.dart';
import 'package:agrobid/services/user_service.dart';
import 'package:agrobid/utils/firebase_constant.dart';
import 'package:customize/customize.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/user_model.dart';

class AuthController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signUpWithEmail(
      {String name, String email, String phone, String password}) async {
    if (!email.isEmptyOrNull && !password.isEmptyOrNull) {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (userCredential != null) {
        UserModel user = UserModel();
        user.fullname = name;
        user.email = email;
        user.phone = phone;
        user.password = password;
        UserService.storeUserData(user);
        Get.offAll(() => AppLayout());
      } else {
        print("error");
        Get.snackbar(
          "Error",
          "Something went wrong",
          backgroundColor: FxColors.dark,
          colorText: FxColors.light,
        );
      }
    } else {
      Get.snackbar("Warning", "Filled all required fields");
    }

    emailController.text = "";
    passwordController.text = "";
  }

  Future<void> signInWithEmail({String email, String password}) async {
    if (!email.isEmptyOrNull && !password.isEmptyOrNull) {
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (user != null) {
        Get.offAll(() => AppLayout());
      } else {
        print("error");
        Get.snackbar(
          "Error",
          "Something went wrong",
          backgroundColor: FxColors.dark,
          colorText: FxColors.light,
        );
      }
    } else {
      Get.snackbar("Warning", "Filled all required fields");
    }

    emailController.text = "";
    passwordController.text = "";
  }

  void logout() {
    auth.signOut();
    Get.offAll(() => LoginScreen());
  }
}
