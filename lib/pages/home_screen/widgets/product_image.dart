import 'package:agrobid/controllers/product_controller.dart';
import 'package:agrobid/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:customize/customize.dart';

Widget buildProductImage(int index) {
  final ProductController _controller = Get.put(ProductController());

  return Stack(
    children: [
      Image.network(_controller.productList[index].image),
      Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          color: colorDangerLight,
          child: Row(
            children: [
              _controller.productList[index].currentPrice != null
                  ? Text(
                      "₹${_controller.productList[index].currentPrice}",
                      style: styleTitle,
                    )
                  : Text("not yet bid").sm,
            ],
          ),
        ),
      ),
    ],
  );
}
