import 'package:agrobid/models/bidder_model.dart';
import 'package:agrobid/widgets/widgets.dart';
import '../models/user_model.dart';
import 'package:flutter/material.dart';

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

List<BidderModel> bidderList = [
  BidderModel(
      id: "0",
      user: userList[1].id,
      biddingPrice: "150",
      minQty: "12",
      date: "01h 34m"),
  BidderModel(
      id: "1",
      user: userList[2].id,
      biddingPrice: "70",
      minQty: "10",
      date: "02h 04m"),
  BidderModel(
      id: "2",
      user: userList[3].id,
      biddingPrice: "90",
      minQty: "20",
      date: "01h 44m"),
  BidderModel(
      id: "3",
      user: userList[3].id,
      biddingPrice: "111",
      minQty: "50",
      date: "01h 34m"),
  BidderModel(
      id: "4",
      user: userList[2].id,
      biddingPrice: "120",
      minQty: "12",
      date: "00h 3m"),
  BidderModel(
      id: "5",
      user: userList[3].id,
      biddingPrice: "97",
      minQty: "17",
      date: "02h 01m"),
  BidderModel(
      id: "7",
      user: userList[1].id,
      biddingPrice: "88",
      minQty: "21",
      date: "03h 27m"),
  BidderModel(
      id: "8",
      user: userList[2].id,
      biddingPrice: "90",
      minQty: "40",
      date: "05h 09m"),
  BidderModel(
      id: "9",
      user: userList[2].id,
      biddingPrice: "90",
      minQty: "2",
      date: "05h 09m"),
];

final menuItems = [
  {"menu": "Home", "icon": Icon(Icons.home)},
  {"menu": "Search", "icon": Icon(Icons.search)},
  {"menu": "Add", "icon": Icon(Icons.add)},
  // {"menu": "Notification", "icon": Icon(Icons.notifications)},
  {
    "menu": "Profile",
    "icon": UserIcon(
      userImage: currentUser[0].image,
    ),
  },
];
