import 'package:aiquiz/models/User.dart';
import 'package:flutter/material.dart';

class Singincontroller {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> get formKey => _formKey; // Getter para acessar a formKey
  TextEditingController get emailController =>
      _emailController; // Getter para acessar o emailController
  TextEditingController get passwordController => _passwordController;

  Future<void> submit(BuildContext context) async {
    User user = User(
      email: _emailController.text,
      password: _passwordController.text,
    );

    bool result = await user.signIn();

    if (result) {
      Navigator.pop(context);
    } else {
      // mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login inválido!',
              style: TextStyle(color: Color.fromARGB(255, 155, 67, 67))),
          backgroundColor: Color.fromARGB(255, 223, 223, 223),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
