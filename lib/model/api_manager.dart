import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/SourceResponse.dart';
import 'package:news_app/model/api_constant.dart';
class ApiManager{
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=53b38c0620e8458f924d7219c914f336
 */
static Future<SourceResponse?> getSources()async{
  Uri url = Uri.https(ApiConstant.baseUrl,ApiConstant.endPoint,{
    "apiKey":"53b38c0620e8458f924d7219c914f336"
  });


try{
  var response=  await http.get(url);
  return SourceResponse.fromJson(jsonDecode(response.body));
}catch(e){
  throw e;
}

}
}