import 'package:agrobid/models/category_model.dart';
import 'package:agrobid/models/product_model.dart';
import 'package:agrobid/models/subcategory_model.dart';
import 'package:agrobid/models/user_model.dart';

List categoryList = [
  CategoryModel(
    id: "0",
    name: "Fruits",
  ),
  CategoryModel(
    id: "1",
    name: "Vegetables",
  ),
];

List subcategoryList = [
  SubcategoryModel(
    id: "0",
    category: categoryList[0],
    name: "Mango",
  ),
  SubcategoryModel(
    id: "1",
    category: categoryList[0],
    name: "Apple",
  ),
  SubcategoryModel(
    id: "2",
    category: categoryList[0],
    name: "Lemon",
  ),
  SubcategoryModel(
    id: "3",
    category: categoryList[1],
    name: "Cabbage",
  ),
  SubcategoryModel(
    id: "4",
    category: categoryList[1],
    name: "Carrot",
  ),
];

List userList = [
  UserModel(
    id: "0",
    username: "aniket",
    email: "aniketkhote99@gmail.com",
    phone: "7721841821",
    city: "Ahmednagar",
    area: "Kolgoan",
  ),
  UserModel(
    id: "1",
    username: "sanket",
    email: "sanketkhote99@gmail.com",
    phone: "9767046835",
    city: "Ahmednagar",
    area: "Kolgoan",
  ),
  UserModel(
    id: "2",
    username: "shubhangi",
    email: "shubhangithore98@gmail.com",
    phone: "1234567890",
    city: "Ahmednagar",
    area: "Newasa",
  ),
  UserModel(
    id: "3",
    username: "xyz",
    email: "xyz@gmail.com",
    phone: "09876543321",
    city: "abc",
    area: "pqr",
  ),
];

List currentUser = [
  UserModel(
    id: "0",
    username: "aniket",
    email: "aniketkhote99@gmail.com",
    phone: "7721841821",
    city: "Ahmednagar",
    area: "Kolgoan",
  ),
];

List productList = [
  ProductModel(
    id: "0",
    title: "Fresh Mangoes",
    discription: "Get a fresh mangoes in a reasonable price 100/kg.",
    date: "01/01/2021",
    image:
        "https://gumlet.assettype.com/thebridgechronicle%2Fimport%2Fs3fs-public%2Fnews-story%2Fcover-images%2F2mangoes_0.jpg?w=1200&auto=format%2Ccompress&ogImage=true",
    user: userList[1],
  ),
  ProductModel(
    id: "1",
    title: "Buy apples in bulk and get discound",
    discription: "Get a fresh apples in a bulk and super discound.",
    date: "017/02/2021",
    image:
        "https://i1.wp.com/www.globaltrademag.com/wp-content/uploads/2020/02/Untitled-design-1.jpg?fit=699%2C393&ssl=1",
    user: userList[2],
  ),
];
