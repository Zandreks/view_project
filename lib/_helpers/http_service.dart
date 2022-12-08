import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/environment.dart';

enum Method { post, get, put, delete, patch }

class HttpService {
  late Dio _dio;

  Logger logger = Logger();

  static Future<Map<String, dynamic>> header() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? localLocale = prefs.getString("locale");
    String? accessToken = prefs.getString('accessToken');
    return {
      "Content-Type": "application/json",
      "Content-Language": localLocale ?? 'ru',
      "Authorization": "Bearer $accessToken",
      "Keep-Alive": "timeout=30, max=2000",
      "Connection": "keep-alive",
    };
  }

  Future<Dio> init() async {
    final String apiHost = Environment().config.apiHost;
    _dio = Dio(BaseOptions(baseUrl: "$apiHost/", headers: await header()));
    initInterceptors();
    return _dio;
  }

  void initInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          logger.d(
              "REQUEST[${requestOptions.method}] => PATH: ${requestOptions.path}"
              "=> REQUEST VALUES: ${requestOptions.queryParameters} => HEADERS: ${requestOptions.headers}");
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          logger
              .i("RESPONSE[${response.statusCode}] => DATA: ${response.data}");
          return handler.next(response);
        },
        onError: (err, handler) {
          logger.i("Error[${err.response?.statusCode}]");
          return handler.next(err);
        },
      ),
    );
  }
}
