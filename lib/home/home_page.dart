import 'package:flutter/material.dart';

import '../utils/style_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var listTabs = [
      "smartphones",
      "laptops",
      "fragrances",
      "skincare",
      "groceries",
      "home-decoration",
      "furniture",
      "tops",
      "womens-dresses",
      "womens-shoes",
      "mens-shirts",
      "mens-shoes",
      "mens-watches",
      "womens-watches",
      "womens-bags",
      "womens-jewellery",
      "sunglasses",
      "automotive",
      "motorcycle",
      "lighting"
    ];

    return DefaultTabController(
      length: listTabs.length,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 24, top: 44, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSearchBar(),
              SizedBox(
                height: 24,
              ),
              buildTabBar(listTabs),
              SizedBox(height: 24),
              buildTabBarView(listTabs)
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildTabBarView(List<String> listTabs) {
    return Expanded(
        child: TabBarView(
            children: listTabs
                .map((title) => Center(
                        child: Text(
                      'Content of Tab $title',
                      style: getBlackTextStyle(),
                    )))
                .toList()));
  }

  TabBar buildTabBar(List<String> listTabs) {
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
      tabs: listTabs.map((title) => Tab(text: title)).toList(),
    );
  }

  Row buildSearchBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 8,
          child: Container(
            height: 48,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.7), spreadRadius: 1, blurRadius: 15)
            ], borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for products...",
                hintStyle: getBlackTextStyle(fontSize: 13),
                prefixIconColor: Colors.blueAccent,
                fillColor: Colors.white,
                filled: true,
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 20,),
        Expanded(
            flex: 1,
            child: IconButton(
              icon: Icon(Icons.shopping_cart_checkout, color: Colors.blueAccent,),
              onPressed: () {},
            ))
      ],
    );
  }
}
