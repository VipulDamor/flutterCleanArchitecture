import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

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
      var response = dio.get(path, options: options);

      debugPrint("URL : ${baseOptions.baseUrl + path}");
      //debugPrint("DATA: ${response.asStream().toString().substring(0, 300)}");

      return response;
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
      var response = dio.post(path, data: requestBody);
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        throw ApiException(message: e.response?.statusMessage);
      } else {
        throw ApiException(message: e.message);
      }
    }
  }
}
