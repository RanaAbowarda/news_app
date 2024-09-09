import 'package:flutter/material.dart';
import 'package:news_app/categroy/category_details.dart';
import 'package:news_app/categroy/category_widget.dart';
import 'package:news_app/home/home_drawer.dart';
import 'package:news_app/home/settings.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/model/search_tab.dart';
import 'package:news_app/theme/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColor.whiteColor,
          image: DecorationImage(
              image: AssetImage("assets/images/back_ground.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColor.whiteColor),
          title: Text(
            selectedItem == HomeDrawer.settings
                ? "Sittings"
                : selectedCategory == null
                    ? "News App"
                    : selectedCategory!.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchTab());
                },
                icon: const Icon(Icons.search))
          ],
        ),
        drawer: Drawer(
            child: HomeDrawer(
          onItemClick: onItemClick,
        )),
        body: selectedItem == HomeDrawer.settings
            ? const SettingsScreen()
            : selectedCategory == null
                ? CategoryWidget(onCategoryClick: onCategoryClick)
                : CategoryDetails(
                    category: selectedCategory!,
                  ),
      ),
    );
  }

  Category? selectedCategory;

  void onCategoryClick(Category newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }

  int selectedItem = HomeDrawer.categories;

  void onItemClick(int newSelectedItem) {
    selectedCategory = null;
    selectedItem = newSelectedItem;
    setState(() {
      Navigator.pop(context);
    });
  }
}
