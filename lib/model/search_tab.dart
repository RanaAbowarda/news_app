import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../news/news_item.dart';
import '../theme/app_color.dart';
import 'api_manager.dart';

class SearchTab extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColor.grayColor),
        ),
        textTheme: TextTheme(
            titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 20,
        )));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: const Icon(Icons.search)),
      IconButton(
          onPressed: () {
            query = "";
            showSuggestions(context);
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSearch();
  }

  Widget buildSearch() {
    return FutureBuilder(
        future: ApiManager.getNews(query: query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text("Some Thing Went Wrong!!"),
                ElevatedButton(
                  onPressed: () {
                    ApiManager.getNews(query: query);
                  },
                  child: const Text("Try Again"),
                ),
              ],
            );
          }
          if (snapshot.data!.status != "ok") {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                  onPressed: () {
                    ApiManager.getNews(
                      query: query,
                    );
                  },
                  child: const Text("Try Again"),
                )
              ],
            );
          }
          var newsList = snapshot.data!.articles!;
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return NewsItem(news: newsList[index]);
              },
              itemCount: newsList.length,
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(
          child: Text(
        "No News",
        style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: AppColor.secondaryGrayColor),
      ));
    } else {
      return buildSearch();
    }
  }
}
