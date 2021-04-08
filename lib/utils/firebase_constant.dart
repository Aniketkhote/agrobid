import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;
final FirebaseStorage storage = FirebaseStorage.instance;

final CollectionReference usersRef = firestore.collection("users");
final CollectionReference productsRef = firestore.collection("products");
final CollectionReference unitsRef = firestore.collection("units");
final CollectionReference categoriesRef = firestore.collection("categories");
final CollectionReference subcategoriesRef =
    firestore.collection("subcategories");
final CollectionReference varitiesRef = firestore.collection("varities");
final CollectionReference biddersRef = firestore.collection("bidders");
