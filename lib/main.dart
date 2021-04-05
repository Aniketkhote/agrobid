import 'package:agrobid/utils/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:customize/customize.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text("Something Went Wrong").container();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
            theme: ThemeData(scaffoldBackgroundColor: colorTertiary),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator().center;
      },
    );
  }
}
