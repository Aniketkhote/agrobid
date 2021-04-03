import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String username;
  String fullname;
  String email;
  String phone;
  String password;
  String city;
  String area;
  String image;

  UserModel({
    this.id,
    this.username,
    this.fullname,
    this.email,
    this.phone,
    this.password,
    this.city,
    this.area,
    this.image,
  });

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot doc) => UserModel(
        id: doc["id"],
        username: doc["username"],
        fullname: doc["fullname"],
        email: doc["email"],
        phone: doc["phone"],
        password: doc["password"],
        city: doc["city"],
        area: doc["area"],
        image: doc["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "fullname": fullname,
        "email": email,
        "phone": phone,
        "password": password,
        "city": city,
        "area": area,
        "image": image,
      };
}
