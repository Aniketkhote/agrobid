import 'package:agrobid/utils/constant.dart';
import 'package:agrobid/utils/data.dart';
import 'package:flutter/material.dart';

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
                "₹${productList[index].currentPrice.toString()}",
                style: styleTitle,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
