import 'package:flutter/material.dart';
import 'package:projeto_flutter/login_screen.dart';
import 'package:projeto_flutter/singup_screen.dart';

class ProductPage extends StatelessWidget {
  final bool isLoggedIn;

  const ProductPage({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lista de produtos (substitua por seus próprios dados)
    final List<Product> products = [
      Product(
        name: 'PLACA DE VÍDEO 4GB',
        price: 'R\$ 600.00',
        imageUrl: 'assets/placa.png',
      ),
      Product(
        name: 'MONITOR 24 pol',
        price: 'R\$ 1000.00',
        imageUrl: 'assets/monitor.png',
      ),
      Product(
        name: 'MOUSE',
        price: 'R\$ 70.00',
        imageUrl: 'assets/mouse.png',
      ),
      Product(
        name: 'TECLADO',
        price: 'R\$ 150.00',
        imageUrl: 'assets/teclado.png',
      ),
      Product(
        name: 'Fonte',
        price: 'R\$ 200.00',
        imageUrl: 'assets/fonte.png',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remover o botão de voltar
        title: const Text('Produtos'),
        backgroundColor: const Color.fromRGBO(190, 15, 140, 0.973),
      ),
      body: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return InkWell(
            onTap: () {
              switch (index) {
                case 0: // Placa de vídeo
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VideoCardDetailScreen()),
                  );
                  break;
                case 1: // Monitor
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MonitorDetailScreen()),
                  );
                  break;
                case 2: // Mouse
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MouseDetailScreen()),
                  );
                  break;
                case 3: // Teclado
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const KeyboardDetailScreen()),
                  );
                  break;
                case 4: // Fonte
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PowerSupplyDetailScreen()),
                  );
                  break;
              }
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    product.imageUrl,
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          product.price,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: isLoggedIn
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProductPage(isLoggedIn: false),
                  ),
                );
              },
              label: const Text('Sair'),
              icon: const Icon(Icons.logout),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignupScreen()),
                    );
                  },
                  label: const Text('Cadastro'),
                ),
                const SizedBox(width: 8), // Add spacing between buttons
                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  label: const Text('Login'),
                  icon: const Icon(Icons.login),
                ),
              ],
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      persistentFooterButtons: [
        Text(
          isLoggedIn ? 'Você está logado!' : 'Você não está logado!',
          style: TextStyle(
            color: isLoggedIn ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }
}

class Product {
  final String name;
  final String price;
  final String imageUrl;

  Product({required this.name, required this.price, required this.imageUrl});
}

// Tela para detalhes da placa de vídeo
class VideoCardDetailScreen extends StatelessWidget {
  const VideoCardDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Placa de Vídeo'),
      ),
      // Adicione os detalhes específicos da placa de vídeo aqui
      body: const Center(
        child: Text('Detalhes da Placa de Vídeo'),
      ),
    );
  }
}

// Tela para detalhes do monitor
class MonitorDetailScreen extends StatelessWidget {
  const MonitorDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Monitor'),
      ),
      // Adicione os detalhes específicos do monitor aqui
      body: const Center(
        child: Text('Detalhes do Monitor'),
      ),
    );
  }
}

// Tela para detalhes do mouse
class MouseDetailScreen extends StatelessWidget {
  const MouseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Mouse'),
      ),
      // Adicione os detalhes específicos do mouse aqui
      body: const Center(
        child: Text('Detalhes do Mouse'),
      ),
    );
  }
}

// Tela para detalhes do teclado
class KeyboardDetailScreen extends StatelessWidget {
  const KeyboardDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Teclado'),
      ),
      // Adicione os detalhes específicos do teclado aqui
      body: const Center(
        child: Text('Detalhes do Teclado'),
      ),
    );
  }
}

// Tela para detalhes da fonte
class PowerSupplyDetailScreen extends StatelessWidget {
  const PowerSupplyDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Fonte'),
      ),
      // Adicione os detalhes específicos da fonte aqui
      body: const Center(
        child: Text('Detalhes da Fonte'),
      ),
    );
  }
}

// Adicione outras telas de detalhes para os produtos restantes

void main() {
  runApp(const MaterialApp(
    home: ProductPage(isLoggedIn: false),
  ));
}
