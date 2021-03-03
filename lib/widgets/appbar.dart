import 'package:agrobid/pages/chat_screen/chat_screen.dart';
import 'package:agrobid/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

AppBar buildAppBar(
    {String title, bool automaticallyImplyLeading, List<Widget> actions}) {
  return AppBar(
    title: Text(
      title ?? "Agrobid".toUpperCase(),
      style: TextStyle(color: colorText, fontSize: 18, fontWeight: fwBold),
    ),
    centerTitle: true,
    automaticallyImplyLeading: automaticallyImplyLeading ?? false,
    actions: actions ??
        [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () => Get.to(() => ChatScreen()),
              child: SvgPicture.asset(
                "assets/icons/chat.svg",
                width: 25,
                color: colorText,
              ),
            ),
          )
        ],
    backgroundColor: Colors.white,
    elevation: 0,
  );
}
