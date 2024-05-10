import 'package:flutter/material.dart';
import 'package:informatic_store/models/user_model.dart';

class AuthController with ChangeNotifier {
  late UserModel _registeredUser; // Inicializa "atrasado"
  UserModel? _loggedInUser;

  AuthController() {
    // Inicializa sem valor nenhum
    _registeredUser = UserModel(email: '', password: '');
  }

  void setUser(UserModel user) {
    _loggedInUser = user;
  }

  UserModel? get loggedInUser => _loggedInUser; // Getter loggedInUser
  UserModel get registeredUser => _registeredUser; // Getter registeredUser

  void login(String email, String password) {
    // Checa se login e senha estão certos
    if (email == _registeredUser.email &&
        password == _registeredUser.password) {
      print('Login Successful for User: $email');
      // seta usuario como logado e registrado
      _loggedInUser = _registeredUser;
      // notifica interface sobre login bem sucedido
      notifyListeners();
    } else {
      print('Login Failed: Invalid credentials');
      // falha no login
      _loggedInUser = null; // seta login como falso
      notifyListeners();
    }
  }

  void register(UserModel user) {
    print(user.email);
    print(user.password);

    // registra novo usuario
    _registeredUser = user.copyWith();

    // cria uma nova instancia de usuario
    _loggedInUser = UserModel(
      email: _registeredUser.email,
      password: _registeredUser.password,
    );
    notifyListeners();
  }
}
