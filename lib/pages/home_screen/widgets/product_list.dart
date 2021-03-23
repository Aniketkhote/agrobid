import 'package:agrobid/utils/constant.dart';
import 'package:agrobid/utils/data.dart';
import 'package:customize/customize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../pages.dart';
import 'product_card.dart';
import 'product_image.dart';

Widget buildProductList() {
  return ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: productList.length,
    itemBuilder: (context, index) => GestureDetector(
      onTap: () =>
          Get.to(() => ProductDetailScreen(productId: productList[index].id)),
      child: ClipRRect(
        borderRadius: FxRadius.radius(
          bottomLeft: 0,
          bottomRight: 0,
          topLeft: 10,
          topRight: 10,
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
