import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://api.mahmoudtaha.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String path, //endpoint
    required Map<String, dynamic>? queries,
    required bool useHeader,
    String? key,
  }) async {
    if (useHeader) {
      dio.options.headers = {
        'token': key,
      };
    }
    return await dio.get(path, queryParameters: queries);
  }

  static Future<Response> postData({
    required String path,
    required Map<String, dynamic> data,
    required bool useHeader,
    String? key,
  }) {
    if (useHeader) {
      dio.options.headers = {
        'token': key,
      };
    }
    return dio.post(path, data: data);
  }
}
