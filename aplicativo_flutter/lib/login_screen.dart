import 'package:flutter/material.dart';
import 'package:projeto_flutter/home_page.dart';
import 'login_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = '';
  String password = '';

  final LoginAuth autenticador = LoginAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color.fromRGBO(190, 15, 140, 0.973),
        foregroundColor: const Color.fromRGBO(0, 0, 0, 0.973),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                    onChanged: (value) {
                      setState(() {
                        username = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 250,
                  child: TextField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    bool login = true;
    bool isValid = await autenticador.validateCredentials(username, password);
    if (isValid) {
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProductPage(isLoggedIn: login),
        ),
      );
    } else {
      // Exibindo um SnackBar quando o login falhar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Seu login está errado!'),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
