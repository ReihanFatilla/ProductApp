import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/bloc/product_category/product_category_cubit.dart';
import 'package:product_app/bloc/product_category/product_category_state.dart';
import 'package:product_app/widgets/tab_home.dart';

import '../utils/style_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Padding buildBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 44, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBar(),
          SizedBox(height: 24),
          TabHome()
        ],
      ),
    );
  }
}