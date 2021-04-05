import 'package:agrobid/models/unit_model.dart';
import 'package:agrobid/utils/firebase_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var unitSelectedValue = RxString();
  var categorySelectedValue = RxString();
  var subcategorySelectedValue = RxString();
  var varietySelectedValue = RxString();

  RxList _units = List<UnitModel>.empty().obs;

  List<UnitModel> get units => _units.toList();

  @override
  void onInit() {
    _units.bindStream(unitList());
    super.onInit();
  }
  // List get categories => categoryList.map((e) => categories.add(e.name));
  // List get subcategories =>
  //     subcategoryList.map((e) => subcategories.add(e.name));
  // List get varieties => varietyList.map((e) => varieties.add(e.name));

  Stream<List<UnitModel>> unitList() {
    Stream<QuerySnapshot> stream = unitsRef.snapshots();

    return stream.map((snapshot) => snapshot.docs
        .map((doc) => UnitModel.fromDocumentSnapshot(doc))
        .toList());
  }
}
