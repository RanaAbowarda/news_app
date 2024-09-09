import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_color.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key});

  static const String routeName = "NewsDetails";

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)?.settings.arguments as News;
    return Container(
        decoration: const BoxDecoration(
          color: AppColor.whiteColor,
          image: DecorationImage(
              image: AssetImage("assets/images/back_ground.png"),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              "News Details",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            iconTheme: const IconThemeData(color: AppColor.whiteColor),
            backgroundColor: AppColor.primaryColor,
            centerTitle: true,
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: news.urlToImage ?? "",
                    width: 360.58,
                    height: 232.5,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(
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
                const SizedBox(
                  height: 15,
                ),
                Text(
                  news.content!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    _launchUrl(news.url!);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Few Full Articles",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
