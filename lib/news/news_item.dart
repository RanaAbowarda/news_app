import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/NewsResponse.dart';
import 'package:news_app/home/news_details.dart';

import '../theme/app_color.dart';

class NewsItem extends StatelessWidget {
  NewsItem({super.key, required this.news});

  News news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, NewsDetails.routeName, arguments: news);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? "",
                width: 360.58,
                height: 232.5,
                placeholder: (context, url) => const CircularProgressIndicator(
                  color: AppColor.primaryColor,
                ),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: AppColor.primaryColor),
              ),
            ),
            Text(news.author ?? "",
                style: Theme.of(context).textTheme.headlineSmall),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(news.title ?? "",
                  style: Theme.of(context).textTheme.bodySmall),
            ),
            Text(
              news.publishedAt!.substring(0, 10) ?? '',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
