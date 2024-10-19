import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MyButton(
      {super.key,
      required this.text,
      this.onTap,
      CircularProgressIndicator? icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2), // Fundo branco translúcido
          borderRadius: BorderRadius.circular(12), // Borda arredondada
          border: Border.all(
            color: Colors.white, // Borda branca para consistência
            width: 1.5, // Espessura da borda
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600, // Negrito suave
            color: Colors.white, // Cor do texto branca
            fontSize: 16, // Tamanho da fonte maior para melhor legibilidade
          ),
        ),
      ),
    );
  }
}
