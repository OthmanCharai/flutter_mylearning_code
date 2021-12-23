import "package:dio/dio.dart";
import 'package:flutter/rendering.dart';

class HelperDio {
  static Dio dio = Dio();
  static void init() {
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: "https://newsapi.org/",
        //method: "v2/top-headlines",
      ),
    );
  }
  static Future<Response> getData({
    required Map<String,dynamic> query,
    required String url,
  }) async {
    return await dio.get(url, queryParameters: query);
  }
}
