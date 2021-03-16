import 'package:agrobid/utils/constant.dart';
import 'package:flutter/material.dart';

class UserIcon extends StatelessWidget {
  final double radius;
  final String userImage;

  const UserIcon({Key key, this.radius, this.userImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
          border: Border.all(color: colorPrimary),
          borderRadius: BorderRadius.circular(100)),
      child: CircleAvatar(
        backgroundImage: NetworkImage(userImage ??
            "https://cdn1.iconfinder.com/data/icons/essential-21/128/User-512.png"),
        backgroundColor: colorPrimaryLight,
        radius: radius ?? 12,
      ),
    );
  }
}
