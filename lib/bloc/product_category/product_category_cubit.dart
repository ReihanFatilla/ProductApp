import 'package:bloc/bloc.dart';
import 'package:product_app/bloc/product_category/product_category_state.dart';
import 'package:product_app/data/repository/product_repository.dart';

class ProductCategoryCubit extends Cubit<ProductCategoryState> {
  ProductCategoryCubit() : super(ProductCategoryLoading()) {
    fetchProductCategory();
  }

  ProductRepository productRepository = ProductRepository();

  void fetchProductCategory() async {
    try {
      List<String> productCategory = await productRepository
          .fetchProductCategory();
      emit(ProductCategoryLoadedState(productCategory));
    } catch(ex) {
      emit( ProductCategoryError(ex.toString()) );
    }
  }
}