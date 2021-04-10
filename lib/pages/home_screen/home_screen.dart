import 'package:agrobid/controllers/product_controller.dart';
import 'package:customize/customize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/widgets.dart';
import 'widgets/product_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductController _controller = Get.put(ProductController());
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        height: Get.height,
        padding: FxPadding.px8,
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildProductList(productList: _controller.productList),
            ],
          ),
        ),
      ),
    );
  }
}
