import 'package:flutter/material.dart';
import 'package:news_app/api/NewsResponse.dart';
import 'package:news_app/api/SourceResponse.dart';
import 'package:news_app/model/api_manager.dart';
import 'package:news_app/news/news_item.dart';
import 'package:news_app/theme/app_color.dart';

class NewsWidget extends StatefulWidget {
  NewsWidget({super.key, required this.source});

  Source source;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

int page = 1;
int pageSize = 20;
ScrollController scrollController = ScrollController();

class _NewsWidgetState extends State<NewsWidget> {
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset != 0) {
        setState(() {
          page++;
          scrollController.animateTo(0,
              duration: const Duration(microseconds: 300),
              curve: Curves.easeInOut);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNews(
            sourceId: widget.source.id ?? '', page: page, pageSize: pageSize),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Some Thing Went Wrong!!"),
                  ElevatedButton(
                    onPressed: () {
                      ApiManager.getNews(
                          sourceId: widget.source.id ?? '',
                          page: page,
                          pageSize: pageSize);
                      setState(() {});
                    },
                    child: const Text("Try Again"),
                  )
                ],
              ),
            );
          }
          if (snapshot.data!.status != "ok") {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data!.message!),
                  ElevatedButton(
                    onPressed: () {
                      ApiManager.getNews(
                          sourceId: widget.source.id ?? '',
                          page: page,
                          pageSize: pageSize);
                      setState(() {});
                    },
                    child: const Text("Try Again"),
                  )
                ],
              ),
            );
          }
          var newsList = snapshot.data!.articles!;
          return Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  page = 1;
                });
              },
              child: ListView.builder(
                controller: scrollController,
                itemBuilder: (context, index) {
                  return NewsItem(news: newsList[index]);
                },
                itemCount: newsList.length,
              ),
            ),
          );
        });
  }
}
