import 'package:agrobid/controllers/product_controller.dart';
import 'package:agrobid/utils/firebase_constant.dart';
import 'package:customize/customize.dart';

import '../../utils/data.dart';
import '../../utils/constant.dart';
import '../../widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/bidder_list.dart';

class ProductDetailScreen extends StatelessWidget {
  final int index;
  final ProductController _controller = Get.put(ProductController());

  ProductDetailScreen(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorTertiary,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                      _controller.productList[index].image,
                      fit: BoxFit.cover,
                      width: Get.width,
                      height: 200,
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
                        buildBidderList(
                            productId: _controller.productList[index].id),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            buildBidPriceBox(),
            auth.currentUser.uid != _controller.productList[index].user
                ? buildMakeBidButton()
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget buildCategoriesBox() {
    return Container(
      margin: EdgeInsets.only(top: 70, bottom: 20),
      padding: FxPadding.px32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _controller.productList[index].title.capitalizeFirst,
            style: styleTitle.copyWith(fontSize: 18, color: colorPrimary),
          ),
          Text(
            _controller.productList[index].detail.capitalizeFirst,
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
                    name: _controller.productList[index].category,
                    label: "Category"),
                VerticalBar(),
                buildCategoryBox(
                    name: _controller.productList[index].subcategory,
                    label: "Subcategory"),
                VerticalBar(),
                buildCategoryBox(
                    name: _controller.productList[index].variety,
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
          name.capitalize,
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
          padding: MaterialStateProperty.all(FxPadding.px12),
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
            buildFeatureBox(
              label: "Starting Price",
              count: _controller.productList[index].startingPrice.toString() +
                  "/" +
                  _controller.units[_controller.productList[index].unit].code,
            ),
            buildFeatureBox(
              label: "Minimum Qty",
              count: _controller.productList[index].minQty.toString() +
                  _controller.units[_controller.productList[index].unit].code,
            ),
            buildFeatureBox(
              label: "Total Bid",
              count: bidderList.length,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFeatureBox({String label, dynamic count}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          count.toString(),
          style: headline,
        ),
        Text(
          label,
          style: overline.copyWith(fontSize: 12, color: colorLabel),
        ),
      ],
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
            CustomTextFormField(
              label: "Enter Quantity",
              hintText: "100",
              controller: _controller.bidQtyController,
            ),
            CustomTextFormField(
              label: "Enter Bidding Price",
              hintText: "120",
              controller: _controller.bidPriceController,
            ),
            CustomButton(onPressed: () {
              _controller.placeBid(pid: _controller.productList[index].id);
              Get.back();
            }),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
