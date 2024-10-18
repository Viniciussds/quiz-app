import 'package:flutter/material.dart';
import 'my_navbar.dart';
import 'my_custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text('Página Inicial', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Perfil', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Configurações', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Verifica o tamanho da tela para layout responsivo
    final bool isWideScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: const Row(
          children: [
            Icon(Icons.quiz, color: Colors.white, size: 34.0),
            SizedBox(width: 10),
            Text('AI Quiz', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white,),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Configurações em breve!')),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isWideScreen
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCardsColumn(), // Exibe cards em uma coluna no modo desktop
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCardsColumn(),
                ],
              ),
      ),
      backgroundColor: Colors.green[50],
      bottomNavigationBar: CustomNavbar(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  // Função para agrupar os cards em uma coluna
  Widget _buildCardsColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomCard(
          title: 'Cadastrar Quiz',
          icon: Icons.add,
          color: Colors.blue,
          onTap: () {
            //rota
          },
        ),
        const SizedBox(height: 20),
        CustomCard(
          title: 'Jogar Quiz',
          icon: Icons.play_arrow,
          color: Colors.green,
          onTap: () {
            //rota
          },
        ),
        const SizedBox(height: 20),
        CustomCard(
          title: 'Historico de quiz',
          icon: Icons.history,
          color: Colors.orange,
          onTap: () {
           //rota
          },
        ),
      ],
    );
  }
}
