import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:informatic_store/controllers/auth_controller.dart';
import 'package:informatic_store/models/user_model.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController;

  LoginScreen({required this.authController});

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    String loginStatus = '';

    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                _loginWithEmailAndPassword(context, _emailController.text, _passwordController.text);
              },
              child: Text('Login'),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text("Ainda não é cadastrado? Clique aqui."),
            ),
          ],
        ),
      ),
    );
  }

  void _loginWithEmailAndPassword(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Se o login for bem-sucedido, você pode navegar para a próxima tela ou fornecer algum feedback
      UserModel user = UserModel(email: email, password: password);
      authController.setUser(user);
      Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      // Em caso de erro, exiba uma mensagem de erro adequada para o usuário
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro: ${e.toString()}'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
