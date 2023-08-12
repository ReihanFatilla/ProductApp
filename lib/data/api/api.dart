import 'package:dio/dio.dart';

class Api{
  Dio _dio = Dio();

  Api(){
    _dio.options.baseUrl = "https://dummyjson.com";
  }

  Dio get sendRequest => _dio;
}