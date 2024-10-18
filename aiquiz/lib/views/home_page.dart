// main.dart
import 'package:flutter/material.dart';
import '../widgets/my_home_layout.dart'; // Importando a HomePage

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
