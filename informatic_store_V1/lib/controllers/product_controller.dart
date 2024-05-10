// controllers/product_controller.dart

import 'package:informatic_store/models/product_model.dart';

class ProductController {
  List<Product> getAllProducts() {
    //  Database estática
    return [
      Product(
        id: '1',
        name: 'Notebook',
        price: 1400.00,
        description: 'Notebook bom para estudar.',
        imageUrl: 'assets/images/laptop.jpg',
      ),
      Product(
        id: '2',
        name: 'Monitor',
        price: 800.00,
        description: 'Monitor de alta qualidade.',
        imageUrl: 'assets/images/monitor.jpg',
      ),
      Product(
        id: '3',
        name: 'Placa de vídeo',
        price: 1100.00,
        description: 'Placa de vídeo com desempenho intermediário.',
        imageUrl: 'assets/images/gpu.jpg',
      ),
      Product(
        id: '4',
        name: 'Teclado',
        price: 200.00,
        description: 'Teclado básico.',
        imageUrl: 'assets/images/keyboard.jpg',
      ),
      Product(
        id: '5',
        name: 'Mouse',
        price: 100.00,
        description: 'Mouse básico.',
        imageUrl: 'assets/images/mouse.jpg',
      ),
      Product(
        id: '6',
        name: 'Processador',
        price: 800.00,
        description: 'Processador com bom desempenho.',
        imageUrl: 'assets/images/cpu.jpg',
      ),
      Product(
        id: '7',
        name: 'Memória RAM',
        price: 250.00,
        description: 'Memória RAM 8 GB',
        imageUrl: 'assets/images/ram.webp',
      )
    ];
  }
}
