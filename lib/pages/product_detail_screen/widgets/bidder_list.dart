import 'package:agrobid/utils/constant.dart';
import 'package:agrobid/utils/data.dart';
import 'package:agrobid/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                buildBidderInfoSheet(userId: bidderList[0].user)),
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

Widget buildBidderInfoSheet({String userId}) => Container(
      color: Colors.white,
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userList[int.parse(userId)].fullname),
          Text(userList[int.parse(userId)].phone),
          Text(userList[int.parse(userId)].city),
          Text(userList[int.parse(userId)].area),
        ],
      ),
    );
