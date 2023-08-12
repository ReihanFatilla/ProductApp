import 'package:product_app/data/model/product_model.dart';

class ProductByCategoryState {}

class ProductByCategoryInitialState extends ProductByCategoryState {}

class ProductByCategoryLoading extends ProductByCategoryState {}

class ProductByCategoryLoadedState extends ProductByCategoryState {
  List<Products> products;
  ProductByCategoryLoadedState(this.products);
}

class ProductByCategoryError extends ProductByCategoryState {
  String error;
  ProductByCategoryError(this.error);
}