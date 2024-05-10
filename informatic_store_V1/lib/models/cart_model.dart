// models/cart.dart

import 'package:informatic_store/models/product_model.dart';

class Cart {
  List<Product> items = [];
  double totalPrice = 0.0;

  void addItem(Product product) {
    items.add(product);
    totalPrice += product.price;
  }

  void removeItem(Product product) {
    items.remove(product);
    totalPrice -= product.price;
  }

  void clearCart() {
    items.clear();
    totalPrice = 0.0;
  }
}
