import 'package:agrobid/models/bidder_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String id;
  String title;
  String detail;
  String image;
  String date;
  String user;
  int startingPrice;
  int currentPrice;
  int minQty;
  String unit;
  String category;
  String subcategory;
  String variety;
  List<BidderModel> biddersList;

  ProductModel({
    this.biddersList,
    this.id,
    this.title,
    this.detail,
    this.image,
    this.date,
    this.user,
    this.startingPrice,
    this.currentPrice,
    this.minQty,
    this.unit,
    this.category,
    this.subcategory,
    this.variety,
  });

  factory ProductModel.fromDocumentSnapshot(DocumentSnapshot doc) =>
      ProductModel(
        id: doc["id"],
        title: doc["title"],
        detail: doc["detail"],
        user: doc["user"],
        startingPrice: doc["startingPrice"],
        currentPrice: doc["currentPrice"],
        minQty: doc["minQty"],
        unit: doc["unit"],
        category: doc["category"],
        subcategory: doc["subcategory"],
        variety: doc["variety"],
      );
}
