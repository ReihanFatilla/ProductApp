import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Api{
  final Dio _dio = Dio();

  Api(){
    _dio.options.baseUrl = "https://dummyjson.com";
    _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get sendRequest => _dio;
}