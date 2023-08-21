import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _imageRow(),
          SizedBox(
            height: 16,
          ),
          _titleRatingRow(),
          SizedBox(
            height: 8,
          ),
          Text(
            widget.product.description ?? "",
            style:
                getBlackTextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _statsRow(
                  "Price", widget.product.price, Icons.price_change_rounded),
              _statsRow("Stock", widget.product.stock, Icons.add_box_rounded),
              _statsRow("Discount", widget.product.discountPercentage,
                  Icons.discount_rounded)
            ],
          ),
        ],
      ),
    );
  }

  Container _statsRow(String title, num? value, IconData icon) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: getBlackTextStyle(
                    fontSize: 11, fontWeight: FontWeight.normal),
              ),
              Text(
                (value ?? 0).toString(),
                style: getBlackTextStyle(
                    fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }

  Row _titleRatingRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.product.category ?? "",
              style: getBlackTextStyle(
                  fontSize: 12, fontWeight: FontWeight.normal),
            ),
            Text(
              widget.product.title ?? "",
              style:
                  getBlackTextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
        RatingBarIndicator(
          rating: (widget.product.rating ?? 0).toDouble(),
          itemBuilder: (context, index) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemSize: 24.0,
        )
      ],
    );
  }

  Container _imageRow() {
    return Container(
      height: 250,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              height: 250,
              padding: EdgeInsets.symmetric(vertical: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    fit: BoxFit.cover,
                    image: widget.product.thumbnail ?? ""),
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
              flex: 2,
              child: Column(
                children: (widget.product.images ?? []).take(3).map((image) {
                  return Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            fit: BoxFit.cover,
                            image: image),
                      ),
                    ),
                  );
                }).toList(),
              ))
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
