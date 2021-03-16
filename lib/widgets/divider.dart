import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final Color colorText;
  final double thickness;
  final double indent;
  final double height;

  const CustomDivider(
      {Key key, this.colorText, this.thickness, this.indent, this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: colorText,
      thickness: thickness ?? 3,
      indent: indent ?? 75,
      endIndent: indent ?? 75,
      height: height ?? 50,
    );
  }
}
