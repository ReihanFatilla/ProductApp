import 'package:flutter/material.dart';
import 'package:product_app/data/model/product_model.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailScreen extends StatefulWidget {
  final Products product;

  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Icon(Icons.arrow_back_rounded),
      actions: [
        Icon(
            isFavorite ? Icons.favorite_border_rounded : Icons.favorite_rounded)
      ],
      backgroundColor: Colors.transparent,
    );
  }
}
