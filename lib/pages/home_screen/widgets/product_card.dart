import 'package:agrobid/utils/constant.dart';
import 'package:agrobid/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          productList[index].detail,
          style: styleTitle.copyWith(fontWeight: FontWeight.w400),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
