import 'package:flutter/material.dart';

Widget buildProductImage(dynamic product) {
  return Stack(
    children: [
      Image.network(product.image),
      // Positioned(
      //   bottom: 0,
      //   right: 0,
      //   child: Container(
      //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      //     color: colorDangerLight,
      //     child: Row(
      //       children: [
      //         product.currentPrice != null
      //             ? Text(
      //                 "₹${product.currentPrice}",
      //                 style: styleTitle,
      //               )
      //             : Text("not yet bid").sm,
      //       ],
      //     ),
      //   ),
      // ),
    ],
  );
}
