import 'package:flutter/material.dart';
import 'package:projeto_flutter/login_screen.dart';
import 'package:projeto_flutter/singup_screen.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lista de produtos (substitua por seus próprios dados)
    final List<Product> products = [
      Product(name: 'Produto 1', price: 'R\$ 100.00'),
      Product(name: 'Produto 2', price: 'R\$ 150.00'),
      Product(name: 'Produto 3', price: 'R\$ 200.00'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
        backgroundColor: Color.fromRGBO(190, 15, 140, 0.973),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return InkWell(
            onTap: () {
              // Exibir um aviso na tela quando o card é pressionado
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Você pressionou o produto: ${product.name}'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: Card(
              child: ListTile(
                title: Text(product.name),
                subtitle: Text(product.price),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        label: Text('Login'),
        icon: Icon(Icons.login),
        backgroundColor: Color.fromRGBO(190, 15, 140, 0.973),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupScreen()),
            );
          },
          child: Text('Cadastro'),
          style: ElevatedButton.styleFrom(
          
          ),
        ),
      ],
    );
  }
}

class Product {
  final String name;
  final String price;

  Product({required this.name, required this.price});
}