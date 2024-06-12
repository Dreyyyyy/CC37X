import 'package:flutter/material.dart';
import 'package:informatic_store/controllers/product_controller.dart';
import 'package:informatic_store/controllers/cart_controller.dart';
import 'package:informatic_store/models/product_model.dart';
import 'package:informatic_store/models/scanner_model.dart'; // Assuming Scanner is defined here

class ProductScreen extends StatelessWidget {
  final ProductController _productController = ProductController();
  final CartController cartController;

  ProductScreen({required this.cartController});

  @override
  Widget build(BuildContext context) {
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.qr_code),
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.973),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Scanner()), // Assuming Scanner widget exists
          );
        },
      ),
      body: FutureBuilder<List<Product>>(
        future: _productController.getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar produtos'));
          } else {
            List<Product> products = snapshot.data ?? [];
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                Product product = products[index];
                return ListTile(
                  leading: SizedBox(
                    height: 60, // Adjust the height as per your requirement
                    width: 60, // Adjust the width as per your requirement
                    child: Image.asset(
                      product.imageUrl,
                      fit: BoxFit.cover, // Use cover to fill the box without distortion
                    ),
                  ),
                  title: Text(product.name),
                  subtitle: Text('R\$${product.price.toStringAsFixed(2)}'),
                  onTap: () {
                    _showProductDetails(context, product);
                  },
                );
              },
            );
          }
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
              SizedBox(
                height: 200, // Adjust the height as per your requirement
                width: double.infinity,
                child: Image.asset(
                  product.imageUrl,
                  fit: BoxFit.cover, // Use cover to fill the box without distortion
                ),
              ),
              SizedBox(height: 10),
              Text(product.description),
              Text('R\$${product.price.toStringAsFixed(2)}'),
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
