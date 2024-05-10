import 'package:flutter/material.dart';
import 'package:informatic_store/controllers/product_controller.dart';
import 'package:informatic_store/controllers/cart_controller.dart';
import 'package:informatic_store/models/product_model.dart';

class ProductScreen extends StatelessWidget {
  final ProductController _productController = ProductController();
  final CartController cartController;

  ProductScreen({required this.cartController});

  @override
  Widget build(BuildContext context) {
    List<Product> products = _productController.getAllProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product product = products[index];
          return ListTile(
            leading: Image.asset(product.imageUrl),
            title: Text(product.name),
            subtitle: Text('R\$${product.price.toString()}'),
            onTap: () {
              _showProductDetails(context, product);
            },
          );
        },
      ),
    );
  }

  void _showProductDetails(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(product.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(product.imageUrl),
              SizedBox(height: 10),
              Text(product.description),
              Text('R\$${product.price.toString()}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
            TextButton(
              onPressed: () {
                cartController.addItemToCart(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Produto adicionado ao carrinho')),
                );
                Navigator.of(context).pop();
              },
              child: Text('Adicionar ao carrinho'),
            ),
          ],
        );
      },
    );
  }
}
