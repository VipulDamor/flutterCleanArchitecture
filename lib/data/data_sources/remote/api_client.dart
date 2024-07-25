import 'package:dio/dio.dart';

import 'api_constant.dart';
import 'api_exception.dart';

class ApiClient {
  late Dio dio;
  late BaseOptions baseOptions;

  ApiClient() {
    baseOptions = BaseOptions(baseUrl: ApiConstant.baseURL);
    dio = Dio(baseOptions);
  }

  Options options = Options();

  Future<Response> getRequest(String path) {
    try {
      return dio.get(path, options: options);
    } on DioException catch (e) {
      if (e.response != null) {
        throw ApiException(message: e.response?.statusMessage);
      } else {
        throw ApiException(message: e.message);
      }
    }
  }

  Future<Response> postRequest({required String path, dynamic requestBody}) {
    try {
      return dio.post(path, data: requestBody);
    } on DioException catch (e) {
      if (e.response != null) {
        throw ApiException(message: e.response?.statusMessage);
      } else {
        throw ApiException(message: e.message);
      }
    }
  }
}
