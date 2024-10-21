import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model.dart';

class ApiHelper{

  static List news = [];
  static List newsInApp = [];
  static Future<List<NewsInfo>> getNews () async{
    List<NewsInfo> news=[];
  var url="https://newsapi.org/v2/top-headlines?country=us&apiKey=ea418d96f2064f73b1031921280f7412";
  var response =await http.get(Uri.parse(url));
  if(response.statusCode==200){
    var responseBody=jsonDecode(response.body);
    for (var element in responseBody['articles']) {
      news.add(NewsInfo.fromJson(element));
    }
  }
  return news ;

  }

}