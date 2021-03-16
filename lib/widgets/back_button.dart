import 'package:agrobid/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackButton extends StatelessWidget {
  const BackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.offAll(() => HomeScreen()),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }
}
