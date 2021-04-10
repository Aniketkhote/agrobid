import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;

  CategoryModel({
    this.id,
    this.name,
  });

  factory CategoryModel.fromDocumentSnapshot(DocumentSnapshot doc) =>
      CategoryModel(
        id: doc.id,
        name: doc["name"],
      );
}
