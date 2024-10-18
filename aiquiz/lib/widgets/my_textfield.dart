import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  const MyTextfield(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.controller,
      this.validator});

  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        color: Colors.white, // Cor do texto no campo de entrada
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor:
            Colors.white.withOpacity(0.1), // Fundo branco com transparência
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white, // Aumentando o contraste do hintText
          fontSize: 16, // Tamanho de fonte maior para melhor legibilidade
          fontWeight: FontWeight.w500, // Negrito suave para maior clareza
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 20.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.white, // Borda branca
            width: 1.5, // Espessura da borda
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.white, // Borda branca quando focado
            width: 2.0,
          ),
        ),
      ),
      obscureText: obscureText,
      validator: validator,
    );
  }
}
