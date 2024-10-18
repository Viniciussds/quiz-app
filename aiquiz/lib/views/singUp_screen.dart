import 'package:aiquiz/controllers/SingUpController.dart';
import 'package:aiquiz/widgets/my_button.dart';
import 'package:aiquiz/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final SingUpController _controller = SingUpController();
  bool _isLoading = false; // Para mostrar carregamento se necessário

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          double padding =
              width > 600 ? 50 : 25; // More padding for larger screens
          double inputWidth = width > 600 ? 300 : 350; // Width of inputs
          double iconSize =
              width > 600 ? 100 : 80; // Larger icon size for larger screens
          double fontSize =
              width > 600 ? 30 : 20; // Larger font size for larger screens

          return DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 14, 65, 17),
                  Color(0xFF43A047),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo image
                    Icon(
                      Icons.quiz,
                      size: iconSize,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 25),
                    // App name
                    Text(
                      "Q U I Z ",
                      style: TextStyle(
                        fontSize: fontSize,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 25),
                    // E-mail input
                    SizedBox(
                      width: inputWidth,
                      child: MyTextfield(
                        hintText: 'Digite seu e-mail',
                        obscureText: false,
                        controller: _controller.emailController,
                        validator: _controller.validateEmail,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Password input
                    SizedBox(
                      width: inputWidth,
                      child: MyTextfield(
                        hintText: 'Digite sua senha',
                        obscureText: true,
                        controller: _controller.passwordController,
                        validator: _controller.validatePassword,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: inputWidth,
                      child: MyTextfield(
                        hintText: 'Confirme sua senha',
                        obscureText: true,
                        controller: _controller.passwordController,
                        validator: (String? value) {
                          return _controller.validateConfirmPassword(value);
                        },
                      ),
                    ),
                    // Forgot password text
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.lock, color: Colors.white, size: 20),
                        SizedBox(width: 5),
                        Text(
                          'Esqueceu sua senha?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Login button
                    MyButton(
                      text: _isLoading ? 'Registrando...' : 'Registrar',
                      onTap: () async {
                        if (!_isLoading) {
                          // Impede múltiplos cliques
                          setState(() {
                            _isLoading = true; // Iniciar carregamento
                          });
                          await _controller.submit(context);
                          setState(() {
                            _isLoading = false; // Parar carregamento
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'já possui uma conta?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            ' faça login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
