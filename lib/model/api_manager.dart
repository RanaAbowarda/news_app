import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/NewsResponse.dart';
import 'package:news_app/api/SourceResponse.dart';
import 'package:news_app/model/api_constant.dart';
class ApiManager{
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=53b38c0620e8458f924d7219c914f336
 */
  static Future<SourceResponse?> getSources(String id) async {
    Uri url = Uri.https(ApiConstant.baseUrl,ApiConstant.endPoint,{
      "apiKey": ApiConstant.apiKey,
      "category": id,
    });


try{
  var response=  await http.get(url);
  return SourceResponse.fromJson(jsonDecode(response.body));
}catch(e){
  throw e;
}
  }

/*
https://newsapi.org/v2/everything?q=bitcoin&apiKey=53b38c0620e8458f924d7219c914f336
 */
  static Future<NewsResponse?> getNews(
      {String? sourceId, String? query, int? page, int? pageSize}) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.newsEndPoint, {
      "apiKey": ApiConstant.apiKey,
      "sources": sourceId,
      "q": query,
      "page": page.toString(),
      "pageSize": pageSize.toString()
    });
    try {
      var newsResponse = await http.get(url);
      return NewsResponse.fromJson(jsonDecode(newsResponse.body));
    } catch (e) {
      throw e;
    }
  }
}