import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class User {
  String _email;
  String _password;

  // Construtor padrão da classe User
  User({
    required String email,
    required String password,
  })  : _email = email,
        _password = password;

  // Getters da classe
  String get email => _email;
  String get password => _password;

  // Setters da classe
  set email(String email) {
    _email = email;
  }

  set password(String password) {
    _password = password;
  }

  // Método para signUp
  Future<bool> signUp() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      return true; // registrado com sucesso
    } catch (e) {
      _handleError(e);
      return false; // erro ao registrar
    }
  }

  // Método para signIn
  Future<bool> signIn() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      return true; // logado com sucesso
    } catch (e) {
      _handleError(e);
      return false; // erro ao logar
    }
  }

  // Método para tratar e exibir erros
  void _handleError(dynamic error) {
    if (kDebugMode) {
      print('Erro: $error');
    }

    // Você pode adicionar lógica para exibir mensagens específicas para o usuário, como:
    // - Email já em uso
    // - Senha fraca
    // - Erros de rede
    // ... e outros erros relevantes.
  }
}
