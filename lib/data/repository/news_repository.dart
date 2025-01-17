import '../../domain/repository/news_repository.dart';
import '../data_sources/remote/api_client.dart';
import '../data_sources/remote/api_endpoints.dart';
import '../models/news_list/news_list.dart';

class NewsRepositoryImpl implements NewsRepository {
  var apiClient = ApiClient();

  @override
  Future<News> getNewsList() async {
    var response = await apiClient.getRequest(ApiEndpoints.newsList);
    News news = News.fromJson(response.data);
    return news;
  }
}
