// ignore_for_file: unnecessary_getters_setters

class Product {
  String _nombre;
  String _rutaImg;
  double _quantity;
  double _price;
  double _subtotal;

  Product(
      this._nombre, this._rutaImg, this._quantity, this._price, this._subtotal);

  String get nombre => _nombre;

  set nombre(String nombre) {
    _nombre = nombre;
  }

  String get rutaImg => _rutaImg;

  set rutaImg(String rutaImg) {
    _rutaImg = rutaImg;
  }

  double get quantity => _quantity;

  set quantity(double quantity) {
    _quantity = quantity;
  }

  double get price => _price;

  set price(double price) {
    _price = price;
  }

  double get subtotal => _subtotal;

  set subtotal(double subtotal) {
    _subtotal = subtotal;
  }
}
