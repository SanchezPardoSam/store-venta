import 'package:flutter/material.dart';
import 'package:store/product.dart';

import 'card.dart';

// ignore: must_be_immutable
class ListCard extends StatefulWidget {
  final List<Product> listProduct;
  const ListCard(this.listProduct, {Key? key}) : super(key: key);
  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  // ignore: prefer_final_fields, unused_field

  @override
  Widget build(BuildContext context) {
   
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.listProduct.length,
        itemBuilder: (BuildContext context, int index) => CardProduct(prod: widget.listProduct[index]),
      ),
    );
  }
}
