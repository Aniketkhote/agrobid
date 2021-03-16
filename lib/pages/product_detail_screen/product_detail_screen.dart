import '../../utils/data.dart';
import '../../utils/constant.dart';
import '../../widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/bidder_list.dart';

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
              Column(
                children: [
                  Stack(
                    children: [
                      Image.network(
                        productList[int.parse(productId)].image,
                        fit: BoxFit.cover,
                        width: Get.width,
                        height: Get.height / 4,
                      ),
                      BackButton()
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          buildCategoriesBox(),
                          CustomDivider(
                            colorText: colorDisabled,
                            thickness: 1,
                            height: 15,
                            indent: 30,
                          ),
                          buildBidderList(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              buildBidPriceBox(),
              buildMakeBidButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategoriesBox() {
    return Container(
      margin: EdgeInsets.only(top: 70, bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productList[int.parse(productId)].title,
            style: styleTitle.copyWith(fontSize: 18, color: colorPrimary),
          ),
          Text(
            productList[int.parse(productId)].detail,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: colorLabel),
          ),
          SizedBox(height: 30),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildCategoryBox(
                    name: productList[int.parse(productId)].category,
                    label: "Category"),
                VerticalBar(),
                buildCategoryBox(
                    name: productList[int.parse(productId)].subcategory,
                    label: "Subcategory"),
                VerticalBar(),
                buildCategoryBox(
                    name: productList[int.parse(productId)].variety,
                    label: "Variety"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryBox({String name, String label}) {
    return Column(
      children: [
        Text(
          name,
          style: styleTitle.copyWith(color: colorPrimary),
        ),
        SizedBox(height: sm1),
        Text(
          label.toUpperCase(),
          style: caption.copyWith(fontSize: 12, fontWeight: fwSemiBold),
        ),
      ],
    );
  }

  Widget buildMakeBidButton() {
    return Positioned(
      bottom: 10,
      left: 30,
      right: 30,
      child: ElevatedButton(
        style: ButtonStyle(
          padding:
              MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: borderRounded)),
          backgroundColor: MaterialStateProperty.all(colorPrimary),
        ),
        onPressed: () => Get.bottomSheet(buildMakeBidBox()),
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
      top: Get.width / 2.3,
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
                  productList[int.parse(productId)].startingPrice.toString(),
                  style: headline,
                ),
                Text(
                  "Starting Price",
                  style: overline.copyWith(fontSize: 14, color: colorLabel),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  bidderList.length.toString(),
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

  Widget buildMakeBidBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.symmetric(horizontal: 30),
      width: Get.width / 2,
      decoration: BoxDecoration(
        color: colorTertiary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomDivider(),
            CustomTextFormField(label: "Enter Quantity", hintText: "100"),
            CustomTextFormField(label: "Enter Bidding Price", hintText: "120"),
            CustomButton(
              onPressed: () => Get.back(),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
