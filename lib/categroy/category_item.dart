import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key, required this.category, required this.index});

  Category category;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      height: 171,
      width: 148,
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(25),
            topRight: const Radius.circular(25),
            bottomLeft: Radius.circular(
              index % 2 == 0 ? 25 : 0,
            ),
            bottomRight: Radius.circular(
              index % 2 == 0 ? 0 : 25,
            ),
          )),
      child: Column(
        children: [
          Image.asset(
            category.image,
            height: MediaQuery.of(context).size.height * .15,
          ),
          Text(
            category.name,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
