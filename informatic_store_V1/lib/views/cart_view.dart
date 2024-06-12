// screens/cart_screen.dart

import 'package:flutter/material.dart';
import 'package:informatic_store/models/product_model.dart';
import 'package:informatic_store/controllers/cart_controller.dart';

class CartScreen extends StatefulWidget {
  final CartController cartController;

  CartScreen({required this.cartController});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: ListView.builder(
        itemCount: widget.cartController.cart.items.length,
        itemBuilder: (context, index) {
          Product product = widget.cartController.cart.items[index];
          return ListTile(
            leading: Image.asset(product.imageUrl),
            title: Text(product.name),
            subtitle: Text('R\$${product.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                setState(() {
                  widget.cartController.removeItemFromCart(product);
                });
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
                  'Total: R\$${widget.cartController.cart.totalPrice.toStringAsFixed(2)}'),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.cartController.clearCart();
                  });
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
