import 'package:agrobid/models/bidder_model.dart';

class ProductModel {
  final String id;
  final String title;
  final String detail;
  final String image;
  final String date;
  final String user;
  final double startingPrice;
  final double currentPrice;
  final String category;
  final String subcategory;
  final String variety;
  final List<BidderModel> biddersList;

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
    this.category,
    this.subcategory,
    this.variety,
  });
}
