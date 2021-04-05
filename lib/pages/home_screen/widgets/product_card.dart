import 'package:agrobid/controllers/product_controller.dart';
import 'package:agrobid/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:customize/customize.dart';
import 'package:get/get.dart';

Widget buildProductCardBody(int index) {
  final ProductController _controller = Get.put(ProductController());
  return Container(
    padding: EdgeInsets.all(sm3),
    width: Get.width,
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_controller.productList[index].title)
            .xl
            .bold
            .color(FxColors.blueGray700)
            .ellipsis
            .maxLine(2),
        Text(_controller.productList[index].detail)
            .lg
            .color(FxColors.blueGray500)
            .ellipsis
            .maxLine(2),
      ],
    ),
  );
}
