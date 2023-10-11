import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage(this.title, {this.price, Key? key}) : super(key: key);
  final String title;
  final int? price;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(title.toString()),
          if (price != null) Text(price!.toString())
        ],
      ),
    );
  }
}
