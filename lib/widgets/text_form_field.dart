import 'package:agrobid/utils/constant.dart';
import 'package:customize/customize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;
  final int maxLines;
  final TextInputType keyboardType;
  final Function validator;

  const CustomTextFormField({
    Key key,
    this.label,
    this.hintText,
    this.controller,
    this.isObscureText,
    this.maxLines,
    this.keyboardType,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label).base.semiBold,
          SizedBox(height: 5),
          TextFormField(
            validator: validator,
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: FxColors.blueGray200,
              hintText: hintText,
              hintStyle: TextStyle(color: FxColors.blueGray500, fontSize: 14),
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
