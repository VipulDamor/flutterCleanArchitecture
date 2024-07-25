import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  static final String _apiKey = dotenv.env['API_KEY'] ?? '';
  static String newsList =
      "top-headlines?sources=espn-cric-info&apiKey=$_apiKey";
}
