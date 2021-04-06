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
  RxList<String> unitList = RxList<String>();
  RxList<String> categoryList = RxList<String>();
  RxList<String> subcategoryList = RxList<String>();
  RxList<String> varietyList = RxList<String>();

  List<ProductModel> get productList => _productsList;

  @override
  void onInit() {
    _getMetaData();

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

  _getunit() async {
    QuerySnapshot snapshot = await unitsRef.get();
    snapshot.docs.forEach((element) {
      unitList.add(
        element.data()["name"],
      );
    });
  }

  _getcategory() async {
    QuerySnapshot snapshot = await categoriesRef.get();
    snapshot.docs.forEach((element) {
      categoryList.add(
        element.data()["name"],
      );
    });
  }

  _getsubcategory() async {
    QuerySnapshot snapshot = await subcategoriesRef.get();
    snapshot.docs.forEach((element) {
      subcategoryList.add(
        element.data()["name"],
      );
    });
  }

  _getvariety() async {
    QuerySnapshot snapshot = await varitiesRef.get();
    snapshot.docs.forEach((element) {
      varietyList.add(
        element.data()["name"],
      );
    });
  }

  _getMetaData() {
    _getProducts();
    _getunit();
    _getcategory();
    _getsubcategory();
    _getvariety();
  }
}
