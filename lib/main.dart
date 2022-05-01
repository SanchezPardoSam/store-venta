import 'package:flutter/material.dart';
import 'package:store/buttonProduct.dart';
import 'package:store/listCard.dart';
import 'package:store/product.dart';

void main() {
  runApp(MaterialApp(
    home: Store(),
  ));
}

class Store extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Store({Key? key}) : super(key: key);

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  // ignore: prefer_final_fields, unused_field
  List<Product> listProduct = [
    Product('teclado', 'Assets/teclado.jpg', 1, 1, 1),
    Product('teclado', 'Assets/teclado.jpg', 2, 2, 2),
    Product('teclado', 'Assets/teclado.jpg', 3, 3, 3),
    Product('teclado', 'Assets/teclado.jpg', 4, 4, 4),
    Product('teclado', 'Assets/teclado.jpg', 5, 5, 5)
  ];
  double base = 0;
  double igv = 0, total = 0;
  String cliente = '', doc = '';
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Store"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Form(
                    key: formKey,
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Cliente',
                          ),
                          onSaved: (value) {
                            cliente = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Por favor ingrese el nombre del cliente';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Documento de identidad',
                            ),
                            onSaved: (value) {
                              doc = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Por favor ingrese documento de identidad';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListCard(listProduct),
                Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  height: 140,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Base imponible: $base',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'IGV:     $igv',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Venta total: $total',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          cliente + '    ' + doc,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 100, right: 50),
                        child: ElevatedButton(
                          onPressed: onCalculate,
                          child: const Text(
                            'Calcular Venta',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FloatingActionButton(
                            onPressed: onDeleted,
                            backgroundColor: Colors.red,
                            child: const Icon(
                              Icons.delete,
                              size: 30,
                            ),
                          ),
                          GetButtonProductAdd(
                              context,
                              const Icon(
                                Icons.add,
                                size: 40,
                              ),
                              Colors.blueAccent,
                              listProduct,
                              refreshPage),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void refreshPage() {
    setState(() {});
  }

  void onDeleted() {
      formKey.currentState!.reset();
      setState(() {
        base = 0;
        igv = 0;
        total = 0;
        listProduct = [];
        cliente = '';
        doc = '';
      });
  }

  void onCalculate() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        base = listProduct.fold(0, (value, pro) => value += pro.subtotal);
        igv = base * 0.18;
        igv = double.parse(igv.toStringAsFixed(2));
        total = base + igv;
        total = double.parse(total.toStringAsFixed(2));
      });
    }
  }
}
