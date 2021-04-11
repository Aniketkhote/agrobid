import 'package:agrobid/pages/app_layout.dart';
import 'package:agrobid/pages/auth_screen/login_screen.dart';
import 'package:agrobid/services/user_service.dart';
import 'package:agrobid/utils/firebase_constant.dart';
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
    UserCredential userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('warning', 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('warning', 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    if (userCredential != null) {
      UserModel user = UserModel()
        ..fullname = name
        ..email = email
        ..phone = phone
        ..image = "null"
        ..city = "null"
        ..area = "null";
      UserService.storeUserData(user);
      Get.offAll(() => AppLayout());
    } else {
      Get.snackbar("Error", "Something went wrong");
    }

    nameController.text = "";
    emailController.text = "";
    phoneController.text = "";
    passwordController.text = "";
  }

  Future<void> signInWithEmail({String email, String password}) async {
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (user != null) {
        Get.offAll(() => AppLayout());
      } else {
        Get.snackbar("Error", "Something went wrong");
      }
      emailController.text = "";
      passwordController.text = "";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('warning', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('warning', 'Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
  }

  void logout() {
    auth.signOut();
    Get.offAll(() => LoginScreen());
  }
}
