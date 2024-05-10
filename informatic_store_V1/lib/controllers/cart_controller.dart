import 'package:flutter/material.dart';
import 'package:informatic_store/models/cart_model.dart';
import 'package:informatic_store/models/product_model.dart';

class CartController with ChangeNotifier {
  final Cart _cart = Cart(); // Cria instancia do carrinho

  Cart get cart => _cart;

  void addItemToCart(Product product) {
    //print(product.name);
    _cart.addItem(product);
    notifyListeners(); // notifica UI
  }

  void removeItemFromCart(Product product) {
    _cart.removeItem(product);
    notifyListeners();
  }

  void clearCart() {
    _cart.clearCart();
    notifyListeners();
  }
}
