import 'package:product_app/data/model/product_model.dart';

class ProductCategoryState {}

class ProductCategoryInitialState extends ProductCategoryState {}

class ProductCategoryLoading extends ProductCategoryState {}

class ProductCategoryLoadedState extends ProductCategoryState {
  List<String> categories;
  ProductCategoryLoadedState(this.categories);
}

class ProductCategoryError extends ProductCategoryState {
  String error;
  ProductCategoryError(this.error);
}