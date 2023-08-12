import 'package:dio/dio.dart';
import 'package:product_app/data/api/api.dart';
import 'dart:convert';

class ProductRepository {
  Api api = Api();

  Future<List<String>> fetchProductCategory() async {
    try{
      Response response = await api.sendRequest.get("/products/categories");
      List<dynamic> productCategoryMap = json.decode(response.data);
      return productCategoryMap.map((item) => item as String).toList();
    } catch(ex){
      rethrow;
    }
  }
}