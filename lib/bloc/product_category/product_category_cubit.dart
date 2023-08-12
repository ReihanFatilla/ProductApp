import 'package:bloc/bloc.dart';
import 'package:product_app/bloc/product_category/product_category_state.dart';

class ProductCategoryCubit extends Cubit<ProductCategoryState>{
  ProductCategoryCubit(): super( ProductCategoryLoading() ){}
}