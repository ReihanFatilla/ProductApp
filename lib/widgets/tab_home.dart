import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/utils/style_manager.dart';

import '../bloc/product_category/product_category_cubit.dart';
import '../bloc/product_category/product_category_state.dart';

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
              child: _buildTabColumn(state.categories)
          );
        }
        return const Center(
          child: Text("An error occured!"),
        );
      },
    );
  }
}

Expanded _buildTabBarView(List<String> listTabs) {
  return Expanded(
      child: TabBarView(
          children: listTabs
              .map((title) =>
              Center(
                  child: Text(
                    'Content of Tab $title',
                    style: getBlackTextStyle(),
                  )))
              .toList()));
}

Expanded _buildTabColumn(List<String> categories) {
  return Expanded(
    child: Column(
      children: [
        _buildTabBar(categories),
        _buildTabBarView(categories)
      ],
    ),
  );
}

TabBar _buildTabBar(List<String> categories) {
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
    tabs: categories.map((title) => Tab(text: title)).toList(),
  );
}
