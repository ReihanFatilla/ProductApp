import 'package:bloc/bloc.dart';
import 'package:product_app/bloc/product_by_category/Product_by_category_state.dart';

import '../../data/model/product_model.dart';
import '../../data/repository/product_repository.dart';

class ProductByCategoryCubit extends Cubit<ProductByCategoryState>{
  ProductByCategoryCubit() : super(ProductByCategoryLoading());

  ProductRepository productRepository = ProductRepository();

  void fetchProductByCategory(String category) async {
    emit(ProductByCategoryLoading());
    try {
      List<Products> productCategory = await productRepository
          .fetchProductByCategory(category);
      emit(ProductByCategoryLoadedState(productCategory));
    } catch(ex) {
      emit( ProductByCategoryError(ex.toString()) );
    }
  }
}