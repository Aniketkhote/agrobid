import 'package:agrobid/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:customize/customize.dart';
import 'package:get/get.dart';

Widget buildProductCardBody(dynamic product) {
  return Container(
    padding: EdgeInsets.all(sm3),
    width: Get.width,
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.title)
            .xl
            .bold
            .color(FxColors.blueGray700)
            .ellipsis
            .maxLine(2),
        Text(product.detail).lg.color(FxColors.blueGray500).ellipsis.maxLine(2),
      ],
    ),
  );
}
