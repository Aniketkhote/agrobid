import 'package:agrobid/models/variety_model.dart';
import 'package:agrobid/widgets/widgets.dart';

import '../models/category_model.dart';
import '../models/product_model.dart';
import '../models/subcategory_model.dart';
import '../models/user_model.dart';
import 'package:flutter/material.dart';

List<CategoryModel> categoryList = [
  CategoryModel(id: "0", name: "Fruits"),
  CategoryModel(id: "1", name: "Vegetables"),
];

List<SubcategoryModel> subcategoryList = [
  SubcategoryModel(
    id: "0",
    name: "Mango",
  ),
  SubcategoryModel(
    id: "1",
    name: "Apple",
  ),
  SubcategoryModel(
    id: "2",
    name: "Lemon",
  ),
  SubcategoryModel(
    id: "3",
    name: "Cabbage",
  ),
  SubcategoryModel(
    id: "4",
    name: "Carrot",
  ),
];

List<VarietyModel> varietyList = [
  VarietyModel(id: "0", name: "Kesar"),
  VarietyModel(id: "1", name: "Dasheri"),
  VarietyModel(id: "2", name: "Badami"),
  VarietyModel(id: "3", name: "Amrapali"),
  VarietyModel(id: "4", name: "Ambri"),
  VarietyModel(id: "5", name: "Honeycrisp"),
  VarietyModel(id: "6", name: "Sunehari"),
  VarietyModel(id: "7", name: " Red Delicious"),
];

List<UserModel> userList = [
  UserModel(
    id: "0",
    fullname: "Aniket Khote",
    username: "aniket",
    email: "aniketkhote99@gmail.com",
    phone: "7721841821",
    city: "Ahmednagar",
    area: "Kolgoan",
  ),
  UserModel(
    id: "1",
    fullname: "Sanket Khote",
    username: "sanket",
    email: "sanketkhote99@gmail.com",
    phone: "9767046835",
    city: "Ahmednagar",
    area: "Kolgoan",
    image:
        "https://w7.pngwing.com/pngs/7/618/png-transparent-man-illustration-avatar-icon-fashion-men-avatar-face-fashion-girl-heroes-thumbnail.png",
  ),
  UserModel(
    id: "2",
    username: "shubhangi",
    fullname: "Shubhangi Thore",
    email: "shubhangithore98@gmail.com",
    phone: "1234567890",
    city: "Ahmednagar",
    area: "Newasa",
    image:
        "https://cdn1.iconfinder.com/data/icons/user-pictures/100/female1-512.png",
  ),
  UserModel(
    id: "3",
    username: "xyz",
    fullname: "xyz",
    email: "xyz@gmail.com",
    phone: "09876543321",
    city: "abc",
    area: "pqr",
  ),
];

List<UserModel> currentUser = [
  UserModel(
      id: "0",
      username: "aniket",
      email: "aniketkhote99@gmail.com",
      phone: "7721841821",
      city: "Ahmednagar",
      area: "Kolgoan",
      fullname: "Aniket Khote",
      image:
          "https://pbs.twimg.com/profile_images/1053694327409569794/jZnL5Amm.jpg"),
];

List<ProductModel> productList = [
  ProductModel(
    id: "0",
    title: "Fresh Mangoes",
    discription: "Get a fresh mangoes in a reasonable price 100/kg.",
    date: "01/01/2021",
    startingPrice: 100,
    averagePrice: 120,
    category: categoryList[0].name,
    subcategory: subcategoryList[0].name,
    variety: varietyList[0].name,
    image:
        "https://gumlet.assettype.com/thebridgechronicle%2Fimport%2Fs3fs-public%2Fnews-story%2Fcover-images%2F2mangoes_0.jpg?w=1200&auto=format%2Ccompress&ogImage=true",
    user: userList[1].id,
  ),
  ProductModel(
    id: "1",
    title: "Buy apples in bulk and get discound",
    discription: "Get a fresh apples in a bulk and super discound.",
    date: "17/02/2021",
    startingPrice: 150,
    averagePrice: 200,
    category: categoryList[0].name,
    subcategory: subcategoryList[1].name,
    variety: varietyList[6].name,
    image:
        "https://i1.wp.com/www.globaltrademag.com/wp-content/uploads/2020/02/Untitled-design-1.jpg?fit=699%2C393&ssl=1",
    user: userList[2].id,
  ),
  ProductModel(
    id: "0",
    title: "Fresh Mangoes",
    discription: "Get a fresh mangoes in a reasonable price 100/kg.",
    date: "01/01/2021",
    startingPrice: 100,
    averagePrice: 120,
    category: categoryList[0].name,
    subcategory: subcategoryList[0].name,
    variety: varietyList[0].name,
    image:
        "https://gumlet.assettype.com/thebridgechronicle%2Fimport%2Fs3fs-public%2Fnews-story%2Fcover-images%2F2mangoes_0.jpg?w=1200&auto=format%2Ccompress&ogImage=true",
    user: userList[1].id,
  ),
  ProductModel(
    id: "1",
    title: "Buy apples in bulk and get discound",
    discription: "Get a fresh apples in a bulk and super discound.",
    date: "17/02/2021",
    startingPrice: 150,
    averagePrice: 200,
    category: categoryList[0].name,
    subcategory: subcategoryList[1].name,
    variety: varietyList[6].name,
    image:
        "https://i1.wp.com/www.globaltrademag.com/wp-content/uploads/2020/02/Untitled-design-1.jpg?fit=699%2C393&ssl=1",
    user: userList[2].id,
  ),
  ProductModel(
    id: "0",
    title: "Fresh Mangoes",
    discription: "Get a fresh mangoes in a reasonable price 100/kg.",
    date: "01/01/2021",
    startingPrice: 100,
    averagePrice: 120,
    category: categoryList[0].name,
    subcategory: subcategoryList[0].name,
    variety: varietyList[0].name,
    image:
        "https://gumlet.assettype.com/thebridgechronicle%2Fimport%2Fs3fs-public%2Fnews-story%2Fcover-images%2F2mangoes_0.jpg?w=1200&auto=format%2Ccompress&ogImage=true",
    user: userList[1].id,
  ),
  ProductModel(
    id: "1",
    title: "Buy apples in bulk and get discound",
    discription: "Get a fresh apples in a bulk and super discound.",
    date: "17/02/2021",
    startingPrice: 150,
    averagePrice: 200,
    category: categoryList[0].name,
    subcategory: subcategoryList[1].name,
    variety: varietyList[6].name,
    image:
        "https://i1.wp.com/www.globaltrademag.com/wp-content/uploads/2020/02/Untitled-design-1.jpg?fit=699%2C393&ssl=1",
    user: userList[2].id,
  ),
  ProductModel(
    id: "0",
    title: "Fresh Mangoes",
    discription: "Get a fresh mangoes in a reasonable price 100/kg.",
    date: "01/01/2021",
    startingPrice: 100,
    averagePrice: 120,
    category: categoryList[0].name,
    subcategory: subcategoryList[0].name,
    variety: varietyList[0].name,
    image:
        "https://gumlet.assettype.com/thebridgechronicle%2Fimport%2Fs3fs-public%2Fnews-story%2Fcover-images%2F2mangoes_0.jpg?w=1200&auto=format%2Ccompress&ogImage=true",
    user: userList[1].id,
  ),
  ProductModel(
    id: "1",
    title: "Buy apples in bulk and get discound",
    discription: "Get a fresh apples in a bulk and super discound.",
    date: "17/02/2021",
    startingPrice: 150,
    averagePrice: 200,
    category: categoryList[0].name,
    subcategory: subcategoryList[1].name,
    variety: varietyList[6].name,
    image:
        "https://i1.wp.com/www.globaltrademag.com/wp-content/uploads/2020/02/Untitled-design-1.jpg?fit=699%2C393&ssl=1",
    user: userList[2].id,
  ),
];

final menuItems = [
  {"menu": "Home", "icon": Icon(Icons.home)},
  {"menu": "Search", "icon": Icon(Icons.search)},
  {"menu": "Add", "icon": Icon(Icons.add)},
  {"menu": "Notification", "icon": Icon(Icons.notifications)},
  {
    "menu": "Profile",
    "icon": UserIcon(
      userImage: currentUser[0].image,
    ),
  },
];
