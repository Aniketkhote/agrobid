import 'package:agrobid/utils/constant.dart';
import 'package:agrobid/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:customize/customize.dart';
import 'package:get/get.dart';

Widget buildProductCardBody(int index) {
  return Container(
    padding: EdgeInsets.all(sm3),
    width: Get.width,
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(productList[index].title, maxLines: 2)
            .xl
            .bold
            .color(FxColors.blueGray700)
            .ellipsis,
        Text(productList[index].detail, maxLines: 2)
            .lg
            .color(FxColors.blueGray500)
            .ellipsis,
      ],
    ),
  );
}
