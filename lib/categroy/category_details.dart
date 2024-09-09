import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';

import '../api/SourceResponse.dart';
import '../model/api_manager.dart';
import '../tab_list/tabs.dart';
import '../theme/app_color.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key, required this.category});

  Category category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(
          widget.category.id,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ));
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  const Text("Some Thing Went Wrong"),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getSources(widget.category.id);
                      },
                      child: const Text("Try Again")),
                ],
              ),
            );
          }
          if (snapshot.data!.status != "ok") {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Some Thing Went Wrong"),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getSources(widget.category.id);
                      },
                      child: const Text("Try Again")),
                ],
              ),
            );
          }
          var sourceList = snapshot.data!.sources;
          return TabWidget(sourceList: sourceList!);
        });
  }
}
