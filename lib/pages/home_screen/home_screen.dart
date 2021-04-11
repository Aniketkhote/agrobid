import 'package:agrobid/controllers/product_controller.dart';
import 'package:agrobid/pages/pages.dart';
import 'package:agrobid/utils/constant.dart';
import 'package:customize/customize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/widgets.dart';
import 'widgets/product_card.dart';
import 'widgets/product_image.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        height: Get.height,
        padding: FxPadding.px8,
        child: SingleChildScrollView(
          child: Column(
            children: [
              GetX<ProductController>(
                init: Get.put(ProductController()),
                builder: (ProductController productController) {
                  if (productController != null &&
                      productController.productList != null) {
                    return ListView.builder(
                      padding: FxPadding.pt32,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: productController.productList.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () async {
                          await productController.getBiders(
                              pid: productController.productList[index].id);
                          Get.to(
                            () => ProductDetailScreen(
                              product: productController.productList[index],
                            ),
                          );
                        },
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
                              buildProductImage(
                                  productController.productList[index]),
                              buildProductCardBody(
                                  productController.productList[index]),
                              Divider(color: colorTertiary),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return LinearProgressIndicator().center;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
