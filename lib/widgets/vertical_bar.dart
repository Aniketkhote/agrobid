import 'package:agrobid/utils/constant.dart';
import 'package:flutter/material.dart';

class VerticalBar extends StatelessWidget {
  final Color color;
  final double height;
  final double width;

  const VerticalBar({Key key, this.color, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? 2, height: height ?? 50, color: color ?? colorDisabled);
  }
}
