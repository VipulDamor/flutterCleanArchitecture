import '../../data/models/news_list/news_list.dart';

abstract class NewsRepository {
  Future<News> getNewsList();
}
