import 'package:aiquiz/models/User.dart';
import 'package:flutter/material.dart';

class SingUpController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  GlobalKey<FormState> get formKey => _formKey; // Getter para acessar a formKey
  TextEditingController get emailController =>
      _emailController; // Getter para acessar o emailController
  TextEditingController get passwordController =>
      _passwordController; // Getter para acessar o passwordController
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController; // Getter para acessar o confirmPasswordController

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite um e-mail válido';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Digite um e-mail válido';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite uma senha válida';
    }
    if (value.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres';
    }
    if (!value.contains(RegExp(r'[!@#\&*~]'))) {
      return 'A senha deve conter pelo menos um caractere especial (!, @, #, &, *, ~)';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite uma senha válida';
    }
    if (value != _passwordController.text) {
      return 'As senhas não coincidem';
    }
    return null;
  }

  Future<void> submit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      User user = User(
        email: _emailController.text,
        password: _passwordController.text,
      );
      bool result = await user.singUp();

      if (result) {
        // navegação para proxima tela e mensagem de sucesso
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuário registrado com sucesso!',
                style: TextStyle(color: Color.fromARGB(255, 48, 90, 35))),
            backgroundColor: Color.fromARGB(255, 223, 223, 223),
            duration: Duration(seconds: 2),
          ),
        );
        Navigator.pushNamed(context, 'home');
      } else {
        // mensagem de erro
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erro ao registrar usuário!',
                style: TextStyle(color: Color.fromARGB(255, 155, 67, 67))),
            backgroundColor: Color.fromARGB(255, 223, 223, 223),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }
}
