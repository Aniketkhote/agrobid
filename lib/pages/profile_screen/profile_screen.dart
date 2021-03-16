import 'dart:io';

import 'package:agrobid/utils/constant.dart';
import 'package:agrobid/utils/data.dart';
import 'package:agrobid/widgets/button.dart';
import 'package:agrobid/widgets/user_icon.dart';
import 'package:customize_flutter/customize_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorTertiary,
      body: SafeArea(
        child: Container(
          width: Get.width,
          child: Column(
            children: [
              buildProfileImage(),
              buildMenu(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenu() {
    return Container(
      child: Column(
        children: [
          buildInkMenuItem(icon: Icons.bookmark, menu: "My Products"),
          buildInkMenuItem(icon: Icons.campaign, menu: "My Bids"),
          buildInkMenuItem(icon: Icons.person, menu: "My Account"),
          buildLogoutButton(),
        ],
      ),
    );
  }

  Widget buildLogoutButton() {
    return CustomButton(
      text: "Logout",
      margin: mt48,
      backgroundColor: colorDanger,
    ).marginSymmetric(horizontal: 30);
  }

  Widget buildInkMenuItem({String menu, IconData icon, Function onTap}) {
    return InkWell(
      splashColor: colorPrimary,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colorPrimaryLight,
          borderRadius: borderCircular,
        ),
        width: Get.width,
        height: 50,
        child: Row(
          children: [
            Icon(
              icon,
              color: colorText,
            ).paddingOnly(left: 20, right: 12),
            Text(
              menu,
              style: styleLabel.copyWith(color: colorPrimary, fontSize: 16),
            ),
          ],
        ),
      ),
    ).marginSymmetric(vertical: 5, horizontal: 30);
  }

  Widget buildProfileImage() {
    return Column(
      children: [
        Stack(
          children: [
            UserIcon(
              userImage: currentUser[0].image ?? null,
              radius: 75,
            ),
            Positioned(
              child: GestureDetector(
                onTap: getImage,
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor: colorPrimary,
                  child: CircleAvatar(
                    child: Icon(Icons.edit, size: 17),
                    radius: 15,
                    backgroundColor: colorTertiary,
                  ),
                ),
              ),
              bottom: 10,
              right: 10,
            ),
          ],
        ),
        Text(
          currentUser[0].fullname,
          style: styleTitle,
        ).pt16,
      ],
    ).py48;
  }
}
