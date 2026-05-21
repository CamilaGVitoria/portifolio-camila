import 'package:flutter/material.dart';
import '../sections/hero_section.dart'; // Ajuste o caminho se necessário

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '< Camila />',
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      // Trocamos o Center por um SingleChildScrollView para permitir rolagem
      body: const SingleChildScrollView(
        child: Column(
          children: [
            // Aqui entra a sua primeira seção!
            HeroSection(),
            
            // As próximas seções entrarão aqui embaixo
            // SizedBox(height: 800), // Apenas para testar o scroll depois
          ],
        ),
      ),
    );
  }
}