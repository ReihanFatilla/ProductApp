import 'package:flutter/material.dart';
import 'package:product_app/data/model/product_model.dart';
import 'package:product_app/utils/style_manager.dart';
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Container(
            height: 250,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 250,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          fit: BoxFit.cover,
                          image: widget.product.images?.first ?? ""),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: (widget.product.images?.getRange(1,
                                  (widget.product.images ?? []).length - 1) ??
                              [])
                          .take(3)
                          .map((image) {
                        return Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                fit: BoxFit.cover,
                                image: image),
                          ),
                        );
                      }).toList(),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_rounded)),
      title: Text(
        "Detail",
        style: getBlackTextStyle(),
      ),
      centerTitle: true,
      actions: [
        Icon(isFavorite
            ? Icons.favorite_border_rounded
            : Icons.favorite_rounded),
        SizedBox(
          width: 24,
        )
      ],
      backgroundColor: Colors.transparent,
    );
  }
}
