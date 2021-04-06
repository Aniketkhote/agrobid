import 'package:cloud_firestore/cloud_firestore.dart';

class UnitModel {
  String id;
  String name;
  String code;

  UnitModel({
    this.id,
    this.name,
    this.code,
  });

  factory UnitModel.fromDocumentSnapshot(DocumentSnapshot doc) => UnitModel(
        id: doc["id"],
        name: doc["name"],
        code: doc["code"],
      );
}
