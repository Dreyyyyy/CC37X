import 'package:flutter/material.dart';
import 'package:informatic_store/controllers/auth_controller.dart';
import 'package:informatic_store/views/login_view.dart';

class SplashScreen extends StatelessWidget {
  final AuthController authController;

  SplashScreen({required this.authController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Vai para o login utilizando o mesmo authController
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(authController: authController),
            ),
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.jpg'),
              SizedBox(height: 16),
              Text(
                'Bem vindo a Loja de Informática!',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
