import 'package:flutter/material.dart';
import 'package:news_app/theme/app_color.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  static const int settings = 2;

  HomeDrawer({super.key, required this.onItemClick});

  Function onItemClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 110,
          width: double.infinity,
          color: AppColor.primaryColor,
          child: Center(
              child: Text(
            "News App!",
            style: Theme.of(context).textTheme.titleLarge,
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              onItemClick(HomeDrawer.categories);
            },
            child: Row(
              children: [
                const Icon(
                  Icons.list,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Categories",
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              onItemClick(HomeDrawer.settings);
            },
            child: Row(
              children: [
                const Icon(
                  Icons.settings,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Settings",
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
