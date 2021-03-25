import 'package:customize/customize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../pages.dart';

class IntroScreen extends StatelessWidget {
  final List data = [
    {
      "image": "assets/images/welcome.svg",
      "title": "Welocme",
      "caption":
          "Welcome to India's first biggest online farm product bidding market."
    },
    {
      "image": "assets/images/options.svg",
      "title": "Place Bid",
      "caption": "Place bid on yours seleted product."
    },
    {
      "image": "assets/images/conversation.svg",
      "title": "Make Deal",
      "caption": "Once your bidding selected then make a deal with a seller."
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FxColors.blueGray900,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: PageView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => buildIntoData(
                imageUrl: data[index]["image"],
                title: data[index]["title"],
                caption: data[index]["caption"],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Get.offAll(() => LoginScreen()),
            child: Text("Get Started"),
          ).container(width: FxWidth.vw100, height: 50).p32,
        ],
      ),
    );
  }

  Widget buildIntoData({String imageUrl, String title, String caption}) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(imageUrl).px48.container(height: 300),
          Text(title).color(color: FxColors.light).xl3.bold.textAlignCenter,
          Text(caption)
              .color(color: FxColors.gray500)
              .lg
              .textAlignCenter
              .px24
              .pt8,
        ],
      ),
    );
  }
}
