import 'package:agrobid/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;
  final int maxLines;

  const CustomTextFormField(
      {Key key,
      this.label,
      this.hintText,
      this.controller,
      this.isObscureText,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: styleLabel),
          SizedBox(height: 5),
          TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: colorTextField,
              hintText: hintText,
              hintStyle: TextStyle(color: colorLabel),
            ),
            style: TextStyle(color: colorText),
            obscureText: isObscureText ?? false,
            maxLines: maxLines ?? 1,
          ),
        ],
      ),
    );
  }
}
