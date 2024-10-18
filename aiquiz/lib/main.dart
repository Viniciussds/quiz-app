// ignore_for_file: unused_import

import 'package:aiquiz/views/login_screen.dart';
import 'package:aiquiz/views/singUp_screen.dart';
import 'package:aiquiz/widgets/my_home_layout.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QUIZ APP',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(), // rota inicial
        '/login': (context) => const LoginPage(), // rota para login
        '/singup': (context) => const SingUpPage(), // rota para cadastro
        '/home' : (context) => const HomePage(), 
      },
    );
  }
}
