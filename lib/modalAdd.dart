// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:store/product.dart';

// ignore: must_be_immutable
class ModalAdd extends StatefulWidget {
  List<Product> listProduct;
  final Function onRefresh;
  ModalAdd({required this.listProduct, key, required this.onRefresh})
      : super(key: key);

  @override
  State<ModalAdd> createState() => _ModalAddState();
}

class _ModalAddState extends State<ModalAdd> {
  String nombre = '';
  String rutaImg = '';
  double quantity = 0;
  double price = 0;
  double subtotal = 0;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'Nuevo producto',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                width: 100,
                height: 40,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre del producto',
                  ),
                  onSaved: (value) {
                    nombre = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese el nombre del producto';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsetsDirectional.only(
                        top: 10, bottom: 10, end: 10),
                    width: 100,
                    height: 40,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Cantidad',
                      ),
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        quantity = double.parse(value!);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'ingrese cantidad';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsetsDirectional.only(
                        top: 10, bottom: 10, end: 10),
                    width: 100,
                    height: 40,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Precio',
                      ),
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        price = double.parse(value!);
                        subtotal = quantity * price;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Ingrese precio';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsetsDirectional.only(
                        top: 10, bottom: 10, end: 10),
                    width: 100,
                    height: 40,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: addInList,
                child: const Text('Agregar'),
              ),
              ElevatedButton(
                onPressed: resetForm,
                child: const Text('Limpiar'),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addInList() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        widget.listProduct.add(
            Product(nombre, 'Assets/teclado.jpg', price, quantity, subtotal));
      });
      widget.onRefresh();
      Navigator.pop(context);
    }
  }
  void resetForm(){
    formKey.currentState!.reset();
  }
}
