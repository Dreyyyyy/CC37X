// controllers_and_services.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:informatic_store/models/product_model.dart';

class ProductController {
  Future<List<Product>> getAllProducts() async {
    final productService = ProductService();
    try {
      return await productService.fetchProducts();
    } catch (e) {
      print('Failed to fetch products: $e');
      return []; // Handle error case appropriately
    }
  }
}

class ProductService {
  Future<List<Product>> fetchProducts() async {
    final descriptions = await _fetchDescriptions(7);

    return [
      Product(
        id: '1',
        name: 'Notebook',
        price: 1400.00,
        description: descriptions[0],
        imageUrl: 'assets/images/laptop.jpg',
      ),
      Product(
        id: '2',
        name: 'Monitor',
        price: 800.00,
        description: descriptions[1],
        imageUrl: 'assets/images/monitor.jpg',
      ),
      Product(
        id: '3',
        name: 'Placa de vídeo',
        price: 1100.00,
        description: descriptions[2],
        imageUrl: 'assets/images/gpu.jpg',
      ),
      Product(
        id: '4',
        name: 'Teclado',
        price: 200.00,
        description: descriptions[3],
        imageUrl: 'assets/images/keyboard.jpg',
      ),
      Product(
        id: '5',
        name: 'Mouse',
        price: 100.00,
        description: descriptions[4],
        imageUrl: 'assets/images/mouse.jpg',
      ),
      Product(
        id: '6',
        name: 'Processador',
        price: 800.00,
        description: descriptions[5],
        imageUrl: 'assets/images/cpu.jpg',
      ),
      Product(
        id: '7',
        name: 'Memória RAM',
        price: 250.00,
        description: descriptions[6],
        imageUrl: 'assets/images/ram.webp',
      )
    ];
  }

  Future<List<String>> _fetchDescriptions(int count) async {
    final response = await http.get(Uri.parse('https://baconipsum.com/api/?type=meat-and-filler&paras=$count'));
    
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((description) => description as String).toList();
    } else {
      throw Exception('Failed to load descriptions');
    }
  }
}
