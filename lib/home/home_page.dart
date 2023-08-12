import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.only(left: 24, top: 32, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              buildSearchBar(),
              SizedBox(height: 24,),

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
                        child: Text('Content of Tab $title')))
                        .toList()));
  }

  TabBar buildTabBar(List<String> listTabs) {
    return TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              isScrollable: true,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blueAccent,
              ),
              tabs: listTabs.map((title) => Tab(text: title)).toList(),
            );
  }

  Column buildSearchBar() {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.blueAccent, spreadRadius: 1, blurRadius: 15)
          ], borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: const TextField(
            decoration: InputDecoration(
              hintText: "Search for products...",
              prefixIconColor: Colors.blueAccent,
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
