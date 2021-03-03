import 'package:agrobid/utils/constant.dart';
import 'package:agrobid/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productId;

  const ProductDetailScreen({Key key, this.productId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorTertiary,
      body: SafeArea(
        child: Container(
          height: Get.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(
                      productList[int.parse(productId)].image,
                      fit: BoxFit.cover,
                      height: Get.height / 4,
                    ),
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productList[int.parse(productId)].title,
                            style: styleTitle.copyWith(
                                fontSize: 18, color: colorPrimary),
                          ),
                          Text(
                            productList[int.parse(productId)].discription,
                            style: TextStyle(color: colorLabel),
                          ),
                          SizedBox(height: 30),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      productList[int.parse(productId)]
                                          .category,
                                      style: styleTitle.copyWith(
                                          color: colorPrimary),
                                    ),
                                    Text(
                                      "Category",
                                      style: caption.copyWith(fontSize: 14),
                                    ),
                                  ],
                                ),
                                Container(
                                    width: 2, height: 50, color: colorDisabled),
                                Column(
                                  children: [
                                    Text(
                                      productList[int.parse(productId)]
                                          .subcategory,
                                      style: styleTitle.copyWith(
                                          color: colorPrimary),
                                    ),
                                    Text(
                                      "Subcategory",
                                      style: caption.copyWith(fontSize: 14),
                                    ),
                                  ],
                                ),
                                Container(
                                    width: 2, height: 50, color: colorDisabled),
                                Column(
                                  children: [
                                    Text(
                                      productList[int.parse(productId)].variety,
                                      style: styleTitle.copyWith(
                                          color: colorPrimary),
                                    ),
                                    Text(
                                      "Variety",
                                      style: caption.copyWith(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              buildBidPriceBox(),
              buildMakeBidButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMakeBidButton() {
    return Positioned(
      bottom: 10,
      left: 30,
      right: 30,
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: borderRounded),
        color: colorPrimary,
        onPressed: () => null,
        child: Text(
          "Place a Bid!",
          style: caption.copyWith(color: colorTertiary, fontSize: 20),
        ),
      ),
    );
  }

  Widget buildBidPriceBox() {
    return Positioned(
      left: 30,
      right: 30,
      top: Get.width / 2.5,
      child: Container(
        padding: EdgeInsets.only(top: 10),
        decoration: decorationRounded,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  productList[int.parse(productId)].averagePrice.toString(),
                  style: headline,
                ),
                Text(
                  "Average Bid",
                  style: overline.copyWith(fontSize: 14, color: colorLabel),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "5",
                  style: headline,
                ),
                Text(
                  "Total Bid",
                  style: overline.copyWith(fontSize: 14, color: colorLabel),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
