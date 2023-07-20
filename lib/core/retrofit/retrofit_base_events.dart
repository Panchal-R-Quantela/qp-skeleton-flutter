import 'package:dio/dio.dart';
import 'package:qp_skeleton_flutter/core/retrofit/rest_client.dart';

class RestClientEvents {
  static Future initRestClient({bool refreshToken = false}) async {
    Dio dio = Dio();
    dio.options.headers['content-type'] = 'application/json';
    dio.interceptors.add(LogInterceptor(responseBody: true));
    return (RestClient(dio));
  }
}
