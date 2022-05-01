// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:store/modalAdd.dart';
import 'package:store/product.dart';

// ignore: non_constant_identifier_names
FloatingActionButton GetButtonProductAdd(
    BuildContext context, Icon icon, Color color, List<Product> listProduct, Function onRefresh) {
  return FloatingActionButton(
    onPressed: () {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return  ModalAdd(listProduct: listProduct,onRefresh: onRefresh,);
          });
    },
    backgroundColor: color,
    child: icon,
  );
}
