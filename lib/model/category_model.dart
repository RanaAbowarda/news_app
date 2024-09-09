import 'dart:ui';

import 'package:news_app/theme/app_color.dart';

class Category {
  String id;
  String image;
  String name;
  Color color;

  Category(
      {required this.color,
      required this.image,
      required this.name,
      required this.id});

  static List<Category> getCategory = [
    Category(
        color: AppColor.redColor,
        image: "assets/images/sports.png",
        name: "Sports ",
        id: "sports"),
    Category(
        color: AppColor.blueColor,
        image: "assets/images/Politics.png",
        name: "General",
        id: "general"),
    Category(
        color: AppColor.pinkColor,
        image: "assets/images/health.png",
        name: "Health",
        id: "health"),
    Category(
        color: AppColor.brownColor,
        image: "assets/images/bussines.png",
        name: "Business",
        id: "business"),
    Category(
        color: AppColor.secondBlueColor,
        image: "assets/images/environment.png",
        name: "Entertainment",
        id: "entertainment"),
    Category(
        color: AppColor.yellowColor,
        image: "assets/images/science.png",
        name: "Science",
        id: "science"),
    Category(
        color: AppColor.brownColor,
        image: "assets/images/science.png",
        name: "Technology",
        id: "technology")
  ];
}
// business entertainment general health science sports technology
