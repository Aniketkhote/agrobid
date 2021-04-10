import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String fullname;
  String email;
  String phone;
  String password;
  String city;
  String area;
  String image;

  UserModel({
    this.id,
    this.fullname,
    this.email,
    this.phone,
    this.city,
    this.area,
    this.image,
  });

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot doc) => UserModel(
        id: doc["id"],
        fullname: doc["fullname"],
        email: doc["email"],
        phone: doc["phone"],
        city: doc["city"],
        area: doc["area"],
        image: doc["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "email": email,
        "phone": phone,
        "city": city,
        "area": area,
        "image": image,
      };
}
