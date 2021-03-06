import 'dart:async';
import 'package:agrobid/pages/app_layout.dart';
import 'package:agrobid/pages/intro_screen/intro_screen.dart';
import 'package:agrobid/utils/firebase_constant.dart';
import 'package:customize/customize.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 3000),
      () => checkUserLogedIn(),
    );
  }

  void checkUserLogedIn() {
    auth.authStateChanges().listen((User user) {
      if (user != null) {
        Get.offAll(() => AppLayout());
      } else {
        Get.offAll(() => IntroScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FxColors.blueGray900,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.workspaces_filled, color: FxColors.light, size: 200),
          Text("Agrobid".toUpperCase()).h6.bold.color(FxColors.light),
        ],
      ).container(width: FxWidth.w100),
    );
  }
}
