import 'package:agrobid/utils/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(scaffoldBackgroundColor: colorTertiary),
    );
  }
}
