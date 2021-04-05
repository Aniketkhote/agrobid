import 'package:agrobid/models/bidder_model.dart';

class ProductModel {
  String id;
  String title;
  String detail;
  String image;
  String date;
  String user;
  double startingPrice;
  double currentPrice;
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
    this.unit,
    this.category,
    this.subcategory,
    this.variety,
  });
}
