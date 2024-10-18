// ignore: file_names
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

// Geter da classe
  String get email => _email;
  String get password => _password;

// Setter da classe
  set email(String email) {
    _email = email;
  }

  set password(String password) {
    _password = password;
  }

  // metodo para singUp
  Future<bool> singUp() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      return true; // registrado com sucesso
    } catch (e) {
      if (kDebugMode) {
        print('Erro ao registrar: $e');
      }
      return false; // erro ao registrar
    }
  }

  // metodo para signIn
  Future<bool> signIn() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      return true; // logado com sucesso
    } catch (e) {
      if (kDebugMode) {
        print('Erro ao logar: $e');
      }
      return false; // erro ao logar
    }
  }
}
