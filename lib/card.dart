import 'package:flutter/material.dart';
import 'package:store/product.dart';

class CardProduct extends StatefulWidget {
  Product prod;
  CardProduct({Key? key, required this.prod}) : super(key: key);

  @override
  State<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 4)
        ],
      ),
      margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              widget.prod.rutaImg,
              height: 100,
            ),
          ),
           Text(
            widget.prod.nombre,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text('Cantidad: '),
                    Text(
                      widget.prod.quantity.toString(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Precio:   '),
                    Text(widget.prod.price.toString()),
                  ],
                ),
                Row(
                  children: [
                    Text('SubTotal: '),
                    Text(widget.prod.subtotal.toString()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
