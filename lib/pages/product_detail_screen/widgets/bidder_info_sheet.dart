import 'package:agrobid/controllers/product_controller.dart';
import 'package:agrobid/controllers/user_controller.dart';
import 'package:agrobid/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:customize/customize.dart';
import 'package:get/get.dart';

class BidderInfoSheet extends StatelessWidget {
  final ProductController _productController = Get.put(ProductController());
  final UserController _userController = Get.put(UserController());
  final UserModel user;

  BidderInfoSheet({this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: FxPadding.p32,
      color: Colors.white,
      width: FxWidth.w100,
      height: FxHeight.h100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(user.fullname).xl3.bold,
          Row(
            children: [
              Text(user.city).color(FxColors.blueGray400).lg,
              Icon(Icons.keyboard_arrow_right, size: 15),
              Text(user.area).color(FxColors.blueGray400).lg,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(_productController.biddersList[0].minQty.toString())
                      .xl
                      .bold,
                  Text("Total Quantity").base.wideLetter,
                ],
              ),
              Column(
                children: [
                  Text(_productController.biddersList[0].biddingPrice
                              .toString() +
                          "/kg")
                      .xl
                      .bold,
                  Text("Bidding Price").base.wideLetter,
                ],
              ),
            ],
          ).py32,
          InkWell(
            onTap: () => _userController.makePhoneCall('tel:+91' + user.phone),
            child: Row(
              children: [
                Icon(Icons.phone, color: FxColors.blueGray400).pr8,
                Text(user.phone).bold.xl,
              ],
            ),
          ),
          InkWell(
            onTap: () => _userController.makePhoneCall('mailto:' + user.email),
            child: Row(
              children: [
                Icon(Icons.email, color: FxColors.blueGray400).pr8,
                Text(user.email).bold.xl,
              ],
            ).pt8,
          ),
        ],
      ),
    );
  }
}
