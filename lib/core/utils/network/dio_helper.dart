import 'package:dio/dio.dart';


class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://AirPoint-EG.com/DEV',
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type': 'application/json',
          }),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic dGVzdDp0ZXN0',
    };
    print('gerttttt');
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };

    return await dio.post(url, queryParameters: query, data: data);
  }
}

