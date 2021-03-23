import 'package:agrobid/utils/constant.dart';
import 'pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
      theme: ThemeData(scaffoldBackgroundColor: colorDisabled),
    );
  }
}
