import 'package:agrobid/pages/pages.dart';
import 'package:agrobid/utils/constant.dart';
import 'package:agrobid/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        height: Get.height,
        color: colorDisabled,
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 30,
                margin: EdgeInsets.only(top: 30, bottom: 20),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(right: sm2),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: colorText, borderRadius: borderCircular),
                    child: Text(
                      subcategoryList[index].name,
                      style: styleTitle.copyWith(color: colorTertiary),
                    ),
                  ),
                  itemCount: subcategoryList.length,
                ),
              ),
              buildProductList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProductList() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: productList.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () =>
            Get.to(() => ProductDetailScreen(productId: productList[index].id)),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildProductImage(index),
              buildProductCardBody(index),
              Divider(color: colorDisabled),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProductCardBody(int index) {
    return Container(
      padding: EdgeInsets.all(sm3),
      width: Get.width,
      color: colorTertiary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productList[index].title,
            style: styleTitle.copyWith(color: colorPrimary),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            productList[index].discription,
            style: styleTitle.copyWith(fontWeight: FontWeight.w400),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget buildProductImage(int index) {
    return Stack(
      children: [
        Image.network(productList[index].image),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: colorTertiary,
            child: Row(
              children: [
                Text(
                  "₹${productList[index].averagePrice.toString()}",
                  style: styleTitle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
