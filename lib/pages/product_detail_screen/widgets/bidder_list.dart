import 'package:agrobid/controllers/product_controller.dart';
import 'package:agrobid/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:customize/customize.dart';

class BidderInfoSheet extends StatelessWidget {
  final UserController _controller = Get.put(UserController());
  final ProductController _pController = Get.put(ProductController());
  final String userId;

  BidderInfoSheet({
    Key key,
    this.userId,
  }) : super(key: key);
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
          Text(_controller.usersList[userId.toInt].fullname).xl3.bold,
          Row(
            children: [
              Text(_controller.usersList[userId.toInt].city)
                  .color(FxColors.blueGray400)
                  .lg,
              Icon(Icons.keyboard_arrow_right, size: 15),
              Text(_controller.usersList[userId.toInt].area)
                  .color(FxColors.blueGray400)
                  .lg,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(_pController.biddersList[userId.toInt].minQty.toString())
                      .xl
                      .bold,
                  Text("Total Quantity").base.wideLetter,
                ],
              ),
              Column(
                children: [
                  Text(_pController.biddersList[userId.toInt].biddingPrice
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
            onTap: () => _controller.makePhoneCall(
                'tel:+91' + _controller.usersList[userId.toInt].phone),
            child: Row(
              children: [
                Icon(Icons.phone, color: FxColors.blueGray400).pr8,
                Text(_controller.usersList[userId.toInt].phone).bold.xl,
              ],
            ),
          ),
          InkWell(
            onTap: () => _controller.makePhoneCall(
                'mailto:' + _controller.usersList[userId.toInt].email),
            child: Row(
              children: [
                Icon(Icons.email, color: FxColors.blueGray400).pr8,
                Text(_controller.usersList[userId.toInt].email).bold.xl,
              ],
            ).pt8,
          ),
        ],
      ),
    );
  }
}
