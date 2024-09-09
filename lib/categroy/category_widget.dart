import 'package:flutter/material.dart';
import 'package:news_app/categroy/category_item.dart';
import 'package:news_app/model/category_model.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key, required this.onCategoryClick});

  var categoryList = Category.getCategory;
  Function onCategoryClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Pick your Category\n of interest ",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    onCategoryClick(categoryList[index]);
                  },
                  child: CategoryItem(
                      category: categoryList[index], index: index));
            },
            itemCount: categoryList.length,
          ))
        ],
      ),
    );
  }
}
