import 'package:flutter/material.dart';
import 'package:projeto_flutter/home_page.dart';
import 'login_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

var counter = 0;

class _LoginScreenState extends State<LoginScreen> {
  String username = '';
  String password = '';

  final LoginAuth autenticador = LoginAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Color.fromRGBO(190, 15, 140, 0.973),
        foregroundColor: Color.fromRGBO(0, 0, 0, 0.973),
      ), //appBar

      body: Column(
        children: [
          Expanded(
              child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
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
            ],
          )),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.login),
        onPressed: () {
          _login();
        },
      ),
    );
  }

  void _login() async {
    print("a");
    bool isValid = await autenticador.validateCredentials(username, password);
    if (isValid) {
      if (!mounted) return;
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductPage(),
          ));
    } else {
      print('Error');
    }
  }
}