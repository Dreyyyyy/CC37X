// screens/cart_screen.dart

import 'package:flutter/material.dart';
import 'package:informatic_store/models/product_model.dart';
import 'package:informatic_store/controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController; // cria uma instância do carrinho

  CartScreen({required this.cartController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: ListView.builder(
        itemCount: cartController.cart.items.length,
        itemBuilder: (context, index) {
          Product product = cartController.cart.items[index];
          return ListTile(
            leading: Image.asset(product.imageUrl),
            title: Text(product.name),
            subtitle: Text('R\$${product.price.toString()}'),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                cartController
                    .removeItemFromCart(product); // remove item do carrinho
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'Total: R\$${cartController.cart.totalPrice.toStringAsFixed(2)}'),
              ElevatedButton(
                onPressed: () {
                  cartController.clearCart(); // Limpa carrinho
                },
                child: Text('Esvaziar Carrinho'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
