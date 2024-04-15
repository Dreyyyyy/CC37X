import 'package:flutter/material.dart';
import 'package:projeto_flutter/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isImagePressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Definindo a cor de fundo como cinza escuro
      body: GestureDetector(
        onTap: () {
          setState(() {
            _isImagePressed = !_isImagePressed;
          });
          if (_isImagePressed) {
            // Redireciona para a página desejada
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ProductPage(isLoggedIn: false),
              ),
            );
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Imagem cobrindo a tela inteira
            Image.asset(
              'splash.png',
              fit: BoxFit.cover,
            ),
            // Efeito que aparece quando a imagem é pressionada
            AnimatedOpacity(
              opacity: _isImagePressed ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            // Texto no centro da tela
            const Center(
              child: Text(
                'Clique em qualquer lugar para continuar!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
