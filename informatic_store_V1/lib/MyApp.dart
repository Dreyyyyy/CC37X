import 'package:flutter/material.dart';
import 'package:informatic_store/controllers/auth_controller.dart';
import 'package:informatic_store/controllers/cart_controller.dart';
import 'package:informatic_store/views/login_view.dart';
import 'package:informatic_store/views/register_view.dart';
import 'package:informatic_store/views/product_view.dart';
import 'package:informatic_store/views/cart_view.dart';
import 'package:informatic_store/views/splash_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthController _authController = AuthController();
  final CartController _cartController = CartController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loja de Informática',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Splash screen como rota inicial
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(
            authController: _authController), // Splash screen route
        '/': (context) =>
            LoginScreen(authController: _authController), // Login screen route
        '/register': (context) => RegisterScreen(
            authController: _authController), // Register screen route
        '/products': (context) =>
            ProductScreen(cartController: _cartController), // Home screen route
        '/cart': (context) =>
            CartScreen(cartController: _cartController), // Cart screen route
      },
    );
  }
}
