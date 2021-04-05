import 'package:agrobid/controllers/product_controller.dart';
import 'package:agrobid/utils/constant.dart';
import 'package:agrobid/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildProductImage(int index) {
  final ProductController _controller = Get.put(ProductController());

  return Stack(
    children: [
      Image.network(productList[index].image),
      Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          color: colorDangerLight,
          child: Row(
            children: [
              Text(
                "₹${_controller.productList[index].currentPrice}",
                style: styleTitle,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
