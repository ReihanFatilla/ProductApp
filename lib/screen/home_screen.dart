import 'package:flutter/material.dart';
import 'package:product_app/widgets/search_bar.dart';
import 'package:product_app/widgets/tab_home.dart';
import '../utils/style_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          SearchBarWidget(),
          SizedBox(height: 24),
          TabHome()
        ],
      ),
    );
  }
}