import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

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
        Icon(isFavorite ? Icons.favorite_border_rounded : Icons.favorite_rounded)
      ],
      backgroundColor: Colors.transparent,
    );
  }
}
