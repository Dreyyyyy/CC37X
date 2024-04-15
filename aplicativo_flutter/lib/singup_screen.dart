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
  String firstName = '';
  String lastName = '';
  String address = '';
  String gender = 'Masculino'; // Inicializando com "Masculino"
  String cep = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        backgroundColor: const Color.fromRGBO(190, 15, 140, 0.973),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome de Usuário',
              ),
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Senha',
              ),
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome',
              ),
              onChanged: (value) {
                setState(() {
                  firstName = value;
                });
              },
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Sobrenome',
              ),
              onChanged: (value) {
                setState(() {
                  lastName = value;
                });
              },
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Endereço',
              ),
              onChanged: (value) {
                setState(() {
                  address = value;
                });
              },
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Gênero',
              ),
              value: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
              items: <String>['Masculino', 'Feminino', 'Outro']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'CEP',
              ),
              onChanged: (value) {
                if (value.length <= 7) {
                  setState(() {
                    cep = value;
                  });
                }
              },
              keyboardType: TextInputType.number,
              maxLength: 7,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signup,
              child: const Text('Cadastrar'),
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
      await file.writeAsString('$username:$password:$firstName:$lastName:$address:$gender:$cep\n', mode: FileMode.append);

      // Após salvar os dados, navega para a tela de produtos
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const ProductPage(isLoggedIn: false),
        ),
      );
    } catch (e) {
      print('Erro ao salvar o arquivo: $e');
    }
  }
}
