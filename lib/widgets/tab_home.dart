import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:product_app/data/model/ProductModel.dart';
import 'package:product_app/utils/style_manager.dart';
import 'package:transparent_image/transparent_image.dart';

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
              child: _buildTabColumn(state.categories));
        }
        return const Center(
          child: Text("An error occured!"),
        );
      },
    );
  }
}

Expanded _buildTabBarView(List<String> listTabs) {
  List<Products> listProducts = [
    Products(
        id: 1,
        title: "iPhone 9",
        description: "An apple mobile which is nothing like apple",
        price: 549,
        discountPercentage: 12.96,
        rating: 4.69,
        stock: 94,
        brand: "Apple",
        category: "smartphones",
        thumbnail: "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
        images: [
          "https://i.dummyjson.com/data/products/1/1.jpg",
          "https://i.dummyjson.com/data/products/1/2.jpg",
          "https://i.dummyjson.com/data/products/1/3.jpg",
          "https://i.dummyjson.com/data/products/1/4.jpg",
          "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
        ]),
  ];

  return Expanded(
      child: TabBarView(
          children: listTabs.map((title) {
    return MasonryGridView.count(
        primary: false,
        shrinkWrap: true,
        itemCount: 4,
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        fit: BoxFit.cover,
                        image: listProducts[0].images![0]),
                  ),
                  Positioned.fill(
                    bottom: -20,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          child: Card(
                            color: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 6,
                              ),
                              child: Text(
                                "Add to cart",
                                style: getWhiteTextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    listProducts[0].title.toString(),
                    style: getBlackTextStyle(fontSize: 12),
                  ),
                  Row(
                    children: [
                      Text(
                        listProducts[0].rating.toString(),
                        style: getRateTextStyle(fontSize: 9),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.star_rounded,
                        color: Colors.blueAccent,
                        size: 16,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 16),
            ],
          );
        });
  }).toList()));
}

Expanded _buildTabColumn(List<String> categories) {
  return Expanded(
    child: Column(
      children: [_buildTabBar(categories), _buildTabBarView(categories)],
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
