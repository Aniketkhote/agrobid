import 'package:agrobid/controllers/user_controller.dart';
import 'package:agrobid/utils/constant.dart';
import 'package:agrobid/utils/data.dart';
import 'package:agrobid/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:customize/customize.dart';

Widget buildBidderList({String productId}) {
  return Container(
    padding: EdgeInsets.only(bottom: 60),
    margin: EdgeInsets.symmetric(horizontal: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Bidders",
          style: styleTitle.copyWith(fontSize: 18),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: bidderList.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () => Get.bottomSheet(
                BidderInfoSheet(userId: bidderList[index].user)),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      UserIcon(
                        radius: 17,
                        userImage:
                            userList[int.parse(bidderList[index].user)].image,
                      ),
                      SizedBox(width: sm3),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              userList[int.parse(bidderList[index].user)]
                                  .fullname,
                              style: styleTitle),
                          Text(bidderList[index].date,
                              style: caption.copyWith(
                                  fontSize: sm3, fontWeight: fwSemiBold)),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 7),
                    decoration: BoxDecoration(
                        borderRadius: borderRounded, color: colorWarning),
                    child: Text("₹${bidderList[index].biddingPrice}",
                        style: styleTitle),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class BidderInfoSheet extends StatelessWidget {
  final UserController _controller = Get.put(UserController());
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
          Text(userList[userId.toInt].fullname).xl3.bold,
          Row(
            children: [
              Text(userList[userId.toInt].city).color(FxColors.blueGray400).lg,
              Icon(Icons.keyboard_arrow_right, size: 15),
              Text(userList[userId.toInt].area).color(FxColors.blueGray400).lg,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(bidderList[userId.toInt - 1].minQty).xl.bold,
                  Text("Total Quantity").base.wideLetter,
                ],
              ),
              Column(
                children: [
                  Text(bidderList[userId.toInt - 1].biddingPrice).xl.bold,
                  Text("Bidding Price").base.wideLetter,
                ],
              ),
            ],
          ).py32,
          InkWell(
            onTap: () => _controller
                .makePhoneCall('tel:+91' + userList[userId.toInt].phone),
            child: Row(
              children: [
                Icon(Icons.phone, color: FxColors.blueGray400).pr8,
                Text(userList[userId.toInt].phone).bold.xl,
              ],
            ),
          ),
          InkWell(
            onTap: () => _controller
                .makePhoneCall('mailto:' + userList[userId.toInt].email),
            child: Row(
              children: [
                Icon(Icons.email, color: FxColors.blueGray400).pr8,
                Text(userList[userId.toInt].email).bold.xl,
              ],
            ).pt8,
          ),
        ],
      ),
    );
  }
}
