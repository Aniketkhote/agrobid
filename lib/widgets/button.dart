import 'package:agrobid/utils/constant.dart';
import 'package:customize_flutter/customize_flutter.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Function onPressed;
  final EdgeInsets margin;

  const CustomButton({
    Key key,
    this.text,
    this.backgroundColor,
    this.textColor,
    this.onPressed,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? 0,
      padding: py(10),
      child: ElevatedButton(
        style: ButtonStyle(
          padding:
              MaterialStateProperty.all(EdgeInsets.symmetric(vertical: sm3)),
          backgroundColor:
              MaterialStateProperty.all(backgroundColor ?? colorPrimary),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            text ?? "submit",
            style: styleTitle.copyWith(color: textColor ?? colorTertiary),
          ),
        ),
      ),
    );
  }
}
