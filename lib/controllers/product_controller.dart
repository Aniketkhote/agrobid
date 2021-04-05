import 'package:agrobid/models/product_model.dart';
import 'package:agrobid/utils/firebase_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var unitSelectedValue = RxString();
  var categorySelectedValue = RxString();
  var subcategorySelectedValue = RxString();
  var varietySelectedValue = RxString();

  RxList<ProductModel> _productsList = RxList<ProductModel>();

  List<ProductModel> get productList => _productsList;

  @override
  void onInit() {
    _getProducts();
    super.onInit();
  }
  // List get categories => categoryList.map((e) => categories.add(e.name));
  // List get subcategories =>
  //     subcategoryList.map((e) => subcategories.add(e.name));
  // List get varieties => varietyList.map((e) => varieties.add(e.name));

  _getProducts() async {
    QuerySnapshot snapshot = await productsRef.get();
    snapshot.docs.forEach((element) {
      _productsList.add(
        ProductModel.fromDocumentSnapshot(element),
      );
    });
  }
}
