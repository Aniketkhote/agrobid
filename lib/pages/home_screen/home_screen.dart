import 'package:agrobid/utils/constant.dart';
import 'package:customize/customize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/widgets.dart';
import 'widgets/product_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        height: Get.height,
        color: colorDisabled,
        padding: FxPadding.px8,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   height: 30,
              //   margin: EdgeInsets.only(top: 30, bottom: 20),
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) => Container(
              //       margin: FxMargin.mr8,
              //       padding: FxPadding.pxy(vertical: 5, horizontal: 10),
              //       decoration: BoxDecoration(
              //           color: colorText, borderRadius: borderCircular),
              //       child: Text(subcategoryList[index].name)
              //           .color(color: FxColors.light)
              //           .blackBold,
              //     ),
              //     itemCount: subcategoryList.length,
              //   ),
              // ),
              buildProductList(),
            ],
          ),
        ),
      ),
    );
  }
}
