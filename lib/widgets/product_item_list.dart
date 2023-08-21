import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_app/screen/detail_screen.dart';
import 'package:transparent_image/transparent_image.dart';

import '../data/model/product_model.dart';
import '../utils/style_manager.dart';

class ProductItemList extends StatelessWidget {
  final Products product;

  const ProductItemList(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/detail", arguments: product);
      },
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    fit: BoxFit.cover,
                    image: product.thumbnail ?? ""),
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
              Expanded(
                child: Text(
                  product.title ?? "",
                  style: getBlackTextStyle(fontSize: 12),
                ),
              ),
              Row(
                children: [
                  Text(
                    (product.rating ?? 0.0).toString(),
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
      ),
    );
  }
}
