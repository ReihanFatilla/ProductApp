import 'package:dio/dio.dart';
import 'package:product_app/data/api/api.dart';

class ProductRepository {
  Api api = Api();

  Future<List<String>> fetchProductCategory() async {
    try{
      Response response = await api.sendRequest.get("/products/categories");
      List<dynamic> productCategoryMap = response.data;
      List<String> productCategories = List<String>.from(productCategoryMap);
      return productCategories;
    } catch(ex){
      rethrow;
    }
  }
}