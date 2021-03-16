import 'package:agrobid/utils/constant.dart';
import 'package:agrobid/utils/data.dart';
import 'package:agrobid/widgets/widgets.dart';
import 'package:flutter/material.dart';

Widget buildBidderList() {
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
          itemBuilder: (context, index) => Container(
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
      ],
    ),
  );
}
