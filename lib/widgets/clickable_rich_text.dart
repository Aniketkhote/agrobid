import 'package:flutter/material.dart';
import 'package:customize/customize.dart';

class CustomClickableRichText extends StatelessWidget {
  final String text;
  final String clickableText;
  final Function onTap;

  const CustomClickableRichText({
    Key key,
    this.text,
    this.clickableText,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text).lg,
        GestureDetector(
            onTap: onTap, child: Text(clickableText).lg.bold.underline),
      ],
    );
  }
}
