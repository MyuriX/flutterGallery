import 'dart:io';

import 'package:dio/dio.dart';
class BaseDio {
  Future<Dio> getBaseDio() async{
    BaseOptions options = BaseOptions(
        baseUrl: "https://api.github.com/",
        connectTimeout: 900000,
        responseType: ResponseType.json,
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json'
        } );

    Dio dio = new Dio(options);
    dio.interceptors.add(LogInterceptor(responseBody: true));
    return dio;
  }
}