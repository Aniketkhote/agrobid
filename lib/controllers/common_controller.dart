import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CommonController extends GetxController {
  var bottomNavigationSeletedIndex = 0.obs;
  var pageCurrentIndex = 0.obs;
  PageController pageController = PageController();
}
