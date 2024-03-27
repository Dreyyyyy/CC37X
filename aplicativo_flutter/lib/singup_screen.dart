import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projeto_flutter/home_page.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        backgroundColor: Color.fromRGBO(190, 15, 140, 0.973),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome de Usuário',
              ),
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Senha',
              ),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signup,
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }

  void _signup() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/autenticacao.txt');

      // Verifica se o arquivo existe
      bool exists = await file.exists();
      
      if (!exists) {
        // Cria o arquivo se não existir
        await file.create();
      }

      // Escreve os dados de cadastro no arquivo
      await file.writeAsString('$username:$password\n', mode: FileMode.append);

      // Após salvar os dados, navega para a tela de produtos
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProductPage(),
        ),
      );
    } catch (e) {
      print('Erro ao salvar o arquivo: $e');
    }
  }
}
