import 'package:dio/dio.dart';
import 'package:product_app/data/api/api.dart';

import '../model/product_model.dart';

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

  Future<List<Products>> fetchProductByCategory(String category) async{
    try{
      print(category);
      Response response = await api.sendRequest.get("/product/category/$category");
      dynamic products = response.data;
      return ProductModel.fromJson(products).products ?? List.empty();
    } catch(ex){
      rethrow;
    }
  }
}