import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = init();

  static init() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.wit.ai/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
     String url = 'message',
    required String query,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer WK4S4PYHTVTYZW3N63LBH7X35UPM52ZG'
    };
    return await dio.get(
      url,
      queryParameters: {
        'q': query
      },
    );
  }

  static Future<Response> getTravelData({
    String url = 'message',
    required String query,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ZZUD4SPWMZKPV5XTNH5OGCRQI6ZDBXO3'
    };
    return await dio.get(
      url,
      queryParameters: {
        'q': query
      },
    );
  }

  static Future<Response> PostData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? ""
    };
    return await dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> PUTData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? ""
    };
    return await dio.put(url, queryParameters: query, data: data);
  }
}
