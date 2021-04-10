import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agrobid/pages/pages.dart';
import '../controllers/common_controller.dart';
import '../utils/constant.dart';
import '../utils/data.dart';

class AppLayout extends StatelessWidget {
  final CommonController controller = Get.put(CommonController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: (value) => controller.pageCurrentIndex.value = value,
        children: [
          HomeScreen(),
          // Container(),
          NewProductScreen(),
          // NotificationScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavyBar(
          items: List.generate(
            menuItems.length,
            (index) => BottomNavyBarItem(
              icon: menuItems[index]["icon"],
              title: Text(menuItems[index]["menu"]),
              activeColor: colorPrimary,
              inactiveColor: colorPrimary.withOpacity(.5),
            ),
          ),
          showElevation: false,
          selectedIndex: controller.bottomNavigationSeletedIndex.value,
          onItemSelected: (value) {
            controller.bottomNavigationSeletedIndex.value = value;
            controller.pageController.jumpToPage(value);
          },
        ),
      ),
    );
  }
}
