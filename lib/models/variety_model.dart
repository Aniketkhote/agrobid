import 'package:cloud_firestore/cloud_firestore.dart';

class VarietyModel {
  String id;
  String name;
  String subcategory;

  VarietyModel({
    this.id,
    this.name,
    this.subcategory,
  });

  factory VarietyModel.fromDocumentSnapshot(DocumentSnapshot doc) =>
      VarietyModel(
        id: doc.id,
        name: doc["name"],
        subcategory: doc["subcategory"],
      );
}
