import 'package:flutter/material.dart';

import '../utils/style_manager.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 8,
          child: Container(
            height: 48,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.7),
                  spreadRadius: 1,
                  blurRadius: 15)
            ], borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for products...",
                hintStyle: getBlackTextStyle(fontSize: 13),
                prefixIconColor: Colors.blueAccent,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
            flex: 1,
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart_checkout,
                color: Colors.blueAccent,
              ),
              onPressed: () {},
            ))
      ],
    );
  }
}
