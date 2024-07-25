import 'dart:convert';

import 'package:testflutterclean/data/data_sources/remote/api_client.dart';
import 'package:testflutterclean/data/models/news_list/news_list.dart';

abstract class NewsRepository {
  Future<News> getNewsList();
}

class NewsRepositoryImpl implements NewsRepository {
  var apiclient = ApiClient();

  @override
  Future<News> getNewsList() async {
    var response = await apiclient.getRequest(
        "top-headlines?sources=espn-cric-info&apiKey=4b16966571914b8ba8fe93ee149891b3");
    var data = jsonDecode(response.data);
    News news = News.fromJson(data);
    return news;
  }
}
