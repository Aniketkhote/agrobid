import 'package:agrobid/models/bidder_model.dart';
import 'package:agrobid/models/category_model.dart';
import 'package:agrobid/models/product_model.dart';
import 'package:agrobid/models/subcategory_model.dart';
import 'package:agrobid/models/unit_model.dart';
import 'package:agrobid/models/variety_model.dart';
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
  RxList<BidderModel> _biddersList = RxList<BidderModel>();

  RxList<UnitModel> _units = RxList<UnitModel>();
  RxList<CategoryModel> _categories = RxList<CategoryModel>();
  RxList<SubcategoryModel> _subcategories = RxList<SubcategoryModel>();
  RxList<VarietyModel> _varieties = RxList<VarietyModel>();

  List<ProductModel> get productList => _productsList;
  List<BidderModel> get biddersList => _biddersList;

  // get lists
  List<UnitModel> get units => _units;
  List<CategoryModel> get categories => _categories;
  List<SubcategoryModel> get subcategories => _subcategories;
  List<VarietyModel> get varities => _varieties;

  // Get list of names
  List<String> get unitList => _units.map((element) => element.name).toList();
  List<String> get categoryList =>
      _categories.map((element) => element.name).toList();
  List<String> get subcategoryList =>
      _subcategories.map((element) => element.name).toList();
  List<String> get varietyList =>
      _varieties.map((element) => element.name).toList();

  @override
  void onInit() {
    _getProducts();
    _getunits();
    _getcategory();
    _getsubcategory();
    _getvariety();
    super.onInit();
  }

  _getProducts() async {
    QuerySnapshot snapshot = await productsRef.get();
    snapshot.docs.forEach((element) {
      _productsList.add(ProductModel.fromDocumentSnapshot(element));
    });
  }

  _getunits() async {
    QuerySnapshot snapshot = await unitsRef.get();
    snapshot.docs.forEach((element) {
      _units.add(UnitModel.fromDocumentSnapshot(element));
    });
  }

  _getcategory() async {
    QuerySnapshot snapshot = await categoriesRef.get();
    snapshot.docs.forEach((element) {
      _categories.add(CategoryModel.fromDocumentSnapshot(element));
    });
  }

  _getsubcategory() async {
    QuerySnapshot snapshot = await subcategoriesRef.get();
    snapshot.docs.forEach((element) {
      _subcategories.add(SubcategoryModel.fromDocumentSnapshot(element));
    });
  }

  _getvariety() async {
    QuerySnapshot snapshot = await varitiesRef.get();
    snapshot.docs.forEach((element) {
      _varieties.add(VarietyModel.fromDocumentSnapshot(element));
    });
  }

  getBiders({String pid}) async {
    QuerySnapshot snapshot =
        await biddersRef.where("productId", isEqualTo: pid).get();
    snapshot.docs.forEach((element) {
      _biddersList.add(BidderModel.fromDocumentSnapshot(element));
    });
  }

  storeProduct() async {
    var unit = units.map((e) {
      if (e.name == unitSelectedValue.value) return e.id;
    });
    var category = categories.map((e) {
      if (e.name == categorySelectedValue.value) return e.id;
    });
    var subcategory = subcategories.map((e) {
      if (e.name == subcategorySelectedValue.value) return e.id;
    });
    var variety = varities.map((e) {
      if (e.name == varietySelectedValue.value) return e.id;
    });

    final now = new DateTime.now();
    String date = DateFormat.yMd().add_jm().format(now);

    await productsRef.doc().set({
      "title": titleController.text.trim(),
      "detail": detailController.text.trim(),
      "date": date,
      "minQty": qtyController.text.trim().toInt,
      "startingPrice": biddingPriceController.text.trim().toInt,
      "currentPrice": null,
      "category": category.whereType<String>().first,
      "subcategory": subcategory.whereType<String>().first,
      "variety": variety.whereType<String>().first,
      "unit": unit.whereType<String>().first,
      "user": auth.currentUser.uid,
      "image": "",
    });

    categorySelectedValue.value = null;
    subcategorySelectedValue.value = null;
    varietySelectedValue.value = null;
    unitSelectedValue.value = null;
  }

  placeBid({String pid}) async {
    final now = new DateTime.now();
    String date = DateFormat.yMd().add_jm().format(now);

    await biddersRef.doc().set({
      "productId": pid,
      "user": auth.currentUser.uid,
      "qty": bidQtyController.text.toInt,
      "biddingPrice": bidPriceController.text.toInt,
      "date": date,
    });
  }
}
