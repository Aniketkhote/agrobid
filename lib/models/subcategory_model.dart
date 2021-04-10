import 'package:cloud_firestore/cloud_firestore.dart';

class SubcategoryModel {
  String id;
  String name;
  String category;

  SubcategoryModel({
    this.id,
    this.name,
    this.category,
  });

  factory SubcategoryModel.fromDocumentSnapshot(DocumentSnapshot doc) =>
      SubcategoryModel(
        id: doc.id,
        name: doc["name"],
        category: doc["category"],
      );
}
