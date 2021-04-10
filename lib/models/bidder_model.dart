import 'package:cloud_firestore/cloud_firestore.dart';

class BidderModel {
  final String id;
  final String productId;
  final String user;
  final String date;
  final int biddingPrice;
  final int minQty;

  BidderModel({
    this.id,
    this.productId,
    this.user,
    this.date,
    this.biddingPrice,
    this.minQty,
  });

  factory BidderModel.fromDocumentSnapshot(DocumentSnapshot doc) => BidderModel(
        id: doc.id,
        productId: doc["productId"],
        user: doc["user"],
        biddingPrice: doc["biddingPrice"],
        minQty: doc["qty"],
        date: doc["date"],
      );
}
