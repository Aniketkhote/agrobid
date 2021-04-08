import 'package:agrobid/models/product_model.dart';
import 'package:agrobid/models/unit_model.dart';
import 'package:agrobid/utils/firebase_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:customize/customize.dart';
import 'package:intl/intl.dart';

class ProductController extends GetxController {
  var unitSelectedValue = RxString();
  var categorySelectedValue = RxString();
  var subcategorySelectedValue = RxString();
  var varietySelectedValue = RxString();

  TextEditingController titleController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  TextEditingController biddingPriceController = TextEditingController();
  TextEditingController qtyController = TextEditingController();

  TextEditingController bidQtyController = TextEditingController();
  TextEditingController bidPriceController = TextEditingController();

  RxList<ProductModel> _productsList = RxList<ProductModel>();
  RxList<String> unitList = RxList<String>();
  RxList<String> categoryList = RxList<String>();
  RxList<String> subcategoryList = RxList<String>();
  RxList<String> varietyList = RxList<String>();

  RxList<UnitModel> _units = RxList<UnitModel>();
  List<UnitModel> get units => _units;

  List<ProductModel> get productList => _productsList;

  @override
  void onInit() {
    _getMetaData();
    _getunits();
    super.onInit();
  }

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

  _getunits() async {
    QuerySnapshot snapshot = await unitsRef.get();
    snapshot.docs.forEach((element) {
      _units.add(
        UnitModel.fromDocumentSnapshot(element),
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

  storeProduct() async {
    await productsRef.doc().set({
      "id": "",
      "title": titleController.text.trim(),
      "detail": detailController.text.trim(),
      "minQty": qtyController.text.trim().toInt,
      "startingPrice": biddingPriceController.text.trim().toInt,
      "currentPrice": null,
      "category": categorySelectedValue.value,
      "subcategory": subcategorySelectedValue.value,
      "variety": varietySelectedValue.value,
      "unit": unitSelectedValue.value,
      "user": auth.currentUser.uid,
      "image": "",
    });
  }

  placeBid({String pid}) async {
    DateTime now = new DateTime.now();
    String date = DateFormat.yMd().add_jm().format(now);

    await biddersRef.doc().set({
      "id": "",
      "productId": pid,
      "user": auth.currentUser.uid,
      "qty": bidQtyController.text.toInt,
      "biddingPrice": bidPriceController.text.toInt,
      "date": date,
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
