import 'package:dio/dio.dart';

class AppDio {
  static Dio? _dio;
  static const String baseUrl = "https://newsapi.org/V2/";

  static void init() {
    _dio ??= Dio(BaseOptions(baseUrl: baseUrl));
  }

  static Future<Response?> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    init();
    return await _dio?.get(
      "$endPoint",
      queryParameters: queryParameters,
    );
  }
  static Future<Response?> post({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    init();
    return await _dio?.post(
      "$endPoint",
      queryParameters: queryParameters,
      data: body ,
    );
  }
}
