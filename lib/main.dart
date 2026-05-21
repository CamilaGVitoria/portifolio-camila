import 'package:flutter/material.dart';
import 'package:portifolio_camila/views/home_view.dart';

void main() {
  runApp(const PortifolioCamila());
}

class PortifolioCamila extends StatelessWidget {
  const PortifolioCamila({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camila | Front-end Developer',
      debugShowCheckedModeBanner: false, // Remove a faixa de "debug" no canto
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black, // Fundo principal da aplicação
        colorScheme: const ColorScheme.dark(
          primary: Colors.orange, // Cor de destaque principal
          secondary: Colors.orangeAccent, // Cor para detalhes secundários
          surface: Color(0xFF1A1A1A), // Cor para cards e superfícies elevadas
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0, // Tira a sombra padrão
          centerTitle: true,
        ),
      ),
      home: const HomeView(),
    );
  }
}