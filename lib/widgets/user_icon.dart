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
        backgroundImage: NetworkImage(
          userImage ??
              "https://icon2.cleanpng.com/20180626/ehy/kisspng-avatar-user-computer-icons-software-developer-5b327cc951ae22.8377289615300354013346.jpg",
        ),
        backgroundColor: colorPrimaryLight,
        radius: radius ?? 12,
      ),
    );
  }
}
