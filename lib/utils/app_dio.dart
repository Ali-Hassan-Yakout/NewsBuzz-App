import 'package:dio/dio.dart';
import 'package:news_buzz/models/app_endpoints.dart';

class AppDio {
  static Dio? _dio;

  static Dio _instance() {
    return _dio ??= Dio(
      BaseOptions(baseUrl: EndPoints.baseUrl),
    );
  }

  static void init() {
    _dio = _instance();
  }

  static Future<Response<dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _dio!.get(
      endPoint,
      queryParameters: queryParameters,
      options: Options(
        headers: {},
      ),
    );
  }

  static Future<Response<dynamic>> post({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    return _dio!.post(
      endPoint,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: {},
      ),
    );
  }

  static Future<Response<dynamic>> put({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    return _dio!.put(
      endPoint,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: {},
      ),
    );
  }

  static Future<Response<dynamic>> delete({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    return _dio!.delete(
      endPoint,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: {},
      ),
    );
  }
}
