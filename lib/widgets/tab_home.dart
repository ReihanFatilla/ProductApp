import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:product_app/bloc/product_by_category/Product_by_category_state.dart';
import 'package:product_app/bloc/product_by_category/product_by_category_cubit.dart';
import 'package:product_app/utils/style_manager.dart';
import '../bloc/product_category/product_category_cubit.dart';
import '../bloc/product_category/product_category_state.dart';
import 'product_item_list.dart';

class TabHome extends StatelessWidget {
  const TabHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCategoryCubit, ProductCategoryState>(
      listener: (context, state) {
        if (state is ProductCategoryError) {
          SnackBar snackBar = SnackBar(
            content: Text(state.error),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        if (state is ProductCategoryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductCategoryLoadedState) {
          return DefaultTabController(
              length: state.categories.length,
              child: _buildTabColumn(state.categories, context));
        }
        return const Center(
          child: Text("An error occured!"),
        );
      },
    );
  }
}

Expanded _buildTabBarView(List<String> categories) {
  return Expanded(
      child: TabBarView(
          children: categories.map((category) {
            return _buildMasonryGridView(ProductByCategoryCubit(), category);
  }).toList()));
}

BlocConsumer<ProductByCategoryCubit, ProductByCategoryState> _buildMasonryGridView(ProductByCategoryCubit productByCategoryCubit, String category) {
  productByCategoryCubit.fetchProductByCategory(category);
  return BlocConsumer<ProductByCategoryCubit, ProductByCategoryState>(
    bloc: productByCategoryCubit,
      listener: (context, state) {
        if (state is ProductByCategoryError) {
          SnackBar snackBar = SnackBar(
            content: Text(state.error),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        if (state is ProductByCategoryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductByCategoryLoadedState) {
          return MasonryGridView.count(
              primary: false,
              shrinkWrap: true,
              itemCount: state.products.length,
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              itemBuilder: (context, index) {
                return ProductItemList(state.products[index]);
              });
        }
        return const Center(
          child: Text("An error occured!"),
        );
  } 
  );
}

Expanded _buildTabColumn(List<String> categories, BuildContext context) {
  return Expanded(
    child: Column(
      children: [
        _buildTabBar(categories, context),
        _buildTabBarView(categories)
      ],
    ),
  );
}

TabBar _buildTabBar(List<String> categories, BuildContext context) {
  return TabBar(
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: Colors.white,
    labelStyle: getBlackTextStyle(fontSize: 12),
    isScrollable: true,
    indicatorWeight: 0.1,
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.blueAccent,
    ),
    onTap: (tabIndex){

    },
    tabs: categories.map((title) => Tab(text: title)).toList(),
  );
}
