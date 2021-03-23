import 'dart:io';

import 'package:agrobid/utils/constant.dart';
import 'package:agrobid/utils/data.dart';
import 'package:agrobid/widgets/button.dart';
import 'package:agrobid/widgets/user_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:customize/customize.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
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
        child: Column(
          children: [
            buildProfileImage(),
            buildMenu(),
          ],
        ),
      ),
    );
  }

  Widget buildMenu() {
    return Column(
      children: [
        buildInkMenuItem(icon: Icons.bookmark, menu: "My Products"),
        buildInkMenuItem(icon: Icons.campaign, menu: "My Bids"),
        buildInkMenuItem(icon: Icons.person, menu: "My Account"),
        buildLogoutButton(),
      ],
    );
  }

  Widget buildLogoutButton() {
    return CustomButton(
      text: "Logout",
      backgroundColor: colorDanger,
    ).px32.pt(top: 80);
  }

  Widget buildInkMenuItem({String menu, IconData icon, Function onTap}) {
    return InkWell(
      splashColor: FxColors.blueGray900,
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: FxColors.blueGray500)
              .paddingOnly(left: 20, right: 12),
          Text(menu).color(color: FxColors.blue800).base.bold,
        ],
      ),
    )
        .container(
          decoration: BoxDecoration(
            borderRadius: FxRadius.radius30,
            color: FxColors.blueGray200,
          ),
          height: 45,
        )
        .px32
        .pt8;
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
        Text(currentUser[0].fullname).h6.pt16,
      ],
    ).py48;
  }
}
