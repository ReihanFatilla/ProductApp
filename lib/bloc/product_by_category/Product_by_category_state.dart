class ProductByCategoryState {}

class ProductByCategoryInitialState extends ProductByCategoryState {}

class ProductByCategoryLoading extends ProductByCategoryState {}

class ProductByCategoryLoadedState extends ProductByCategoryState {
  List<String> categories;
  ProductByCategoryLoadedState(this.categories);
}

class ProductByCategoryError extends ProductByCategoryState {
  String error;
  ProductByCategoryError(this.error);
}