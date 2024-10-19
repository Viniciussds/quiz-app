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
      body: DecoratedBox(
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
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: _controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.quiz,
                    size: 80,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    "Q U I Z ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Flexible(
                    child: MyTextfield(
                      hintText: 'Digite seu e-mail',
                      obscureText: false,
                      controller: _controller.emailController,
                      validator: _controller.validateEmail,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    child: MyTextfield(
                      hintText: 'Digite sua senha',
                      obscureText: true,
                      controller: _controller.passwordController,
                      validator: (String? value) {
                        return _controller.validatePassword(value);
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    child: MyTextfield(
                      hintText: 'Confirme sua senha',
                      obscureText: true,
                      controller: _controller.confirmPasswordController,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Botão de registro
                  MyButton(
                    text: _isLoading ? 'Registrando...' : 'Registrar',
                    icon: _isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : null,
                    onTap: () async {
                      if (!_isLoading) {
                        // Exibir diálogo de carregamento
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                        );

                        setState(() {
                          _isLoading = true; // Iniciar carregamento
                        });

                        // Executar o método de registro
                        await _controller.submit(context);

                        // Fechar o diálogo de carregamento
                        Navigator.pop(context);

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
                        'Já possui uma conta?',
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
                          ' Faça login',
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
        ),
      ),
    );
  }
}
