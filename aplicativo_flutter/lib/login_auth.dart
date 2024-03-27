import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class LoginAuth {
  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/autenticacao.txt');
  }

  Future<bool> validateCredentials(String username, String password) async {
    final loginString = await loadAsset();
    print(loginString);
    final lines = LineSplitter().convert(loginString);
    print(lines);
    for (var line in lines) {
      var parts =
          line.split('/');
      if (parts.length == 2) {
        var storedUsername = parts[0];
        var storedPassword = parts[1];
        // print(username + storedUsername + ' | ' + password + storedPassword);

        if (username == storedUsername && password == storedPassword) {
          return true;
        }
      }
    }

    return false;
  }
}