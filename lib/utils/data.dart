import 'package:agrobid/widgets/widgets.dart';
import '../models/user_model.dart';
import 'package:flutter/material.dart';

List<UserModel> currentUser = [
  UserModel(
    id: "0",
    email: "aniketkhote99@gmail.com",
    phone: "7721841821",
    city: "Ahmednagar",
    area: "Kolgoan",
    fullname: "Aniket Khote",
  ),
];

final menuItems = [
  {"menu": "Home", "icon": Icon(Icons.home)},
  // {"menu": "Search", "icon": Icon(Icons.search)},
  {"menu": "Add", "icon": Icon(Icons.add)},
  // {"menu": "Notification", "icon": Icon(Icons.notifications)},
  {
    "menu": "Profile",
    "icon": UserIcon(userImage: currentUser[0].image ?? null),
  },
];
