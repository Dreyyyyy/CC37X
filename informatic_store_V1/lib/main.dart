import 'package:flutter/material.dart';
import 'package:informatic_store/controllers/auth_controller.dart';
import 'package:informatic_store/controllers/cart_controller.dart';
import 'package:informatic_store/views/login_view.dart';
import 'package:informatic_store/views/register_view.dart';
import 'package:informatic_store/views/product_view.dart';
import 'package:informatic_store/views/cart_view.dart';
import 'package:informatic_store/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/splash': (context) =>
            SplashScreen(authController: _authController), // Splash screen
        '/': (context) =>
            ProductScreen(cartController: _cartController), // Home screen
        '/cart': (context) =>
            CartScreen(cartController: _cartController), // Cart screen
        '/login': (context) =>
            LoginScreen(authController: _authController), // Login screen
        '/register': (context) =>
            RegisterScreen(authController: _authController), // Register screen
      },
    );
  }
}