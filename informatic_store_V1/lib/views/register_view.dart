import 'package:flutter/material.dart';
import 'package:informatic_store/controllers/auth_controller.dart';
import 'package:informatic_store/models/user_model.dart';

class RegisterScreen extends StatefulWidget {
  final AuthController authController;

  RegisterScreen({required this.authController});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String registerStatus = ''; // Inicializa variavel de registro

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Sobrenome'),
            ),
            SizedBox(height: 16),
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
                UserModel user = UserModel(
                  firstName: _firstNameController.text.trim(),
                  lastName: _lastNameController.text.trim(),
                  email: _emailController.text.trim(),
                  password: _passwordController.text.trim(),
                );
                widget.authController.register(user);

                // Seta registro baseado no authcontroller
                if (widget.authController.registeredUser.email == user.email) {
                  setState(() {
                    registerStatus = 'Cadastro concluído!';
                  });
                } else {
                  setState(() {
                    registerStatus = 'Error: Falha ao cadastrar.';
                  });
                }
              },
              child: Text('Registrar'),
            ),
            SizedBox(height: 16),
            Text(
              registerStatus,
              style: TextStyle(
                color: registerStatus.contains('Bem Sucedido')
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
