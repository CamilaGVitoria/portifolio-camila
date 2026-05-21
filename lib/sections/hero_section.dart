import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    // 1. Lendo o tamanho da tela para criar o nosso "breakpoint"
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600; // Define que telas menores que 600px são mobile

    return Container(
      width: double.infinity,
      // 2. Padding dinâmico: menor no mobile, maior no desktop
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 40, 
        vertical: isMobile ? 60 : 80,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Olá, eu sou a Camila",
            style: TextStyle(
              fontSize: isMobile ? 22 : 28, // 3. Fonte adaptável
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 16),
          SelectableText(
            "Desenvolvedora Front-end",
            style: TextStyle(
              fontSize: isMobile ? 36 : 56, // Ajuste drástico para caber no celular
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
              letterSpacing: isMobile ? 1.0 : 2.0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          
          // 4. Trocamos o SizedBox(width: 600) por ConstrainedBox
          // Isso garante que no desktop ele tenha no máximo 600px, 
          // mas no mobile ele encolhe naturalmente respeitando as bordas.
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SelectableText(
              "Especializada em criar interfaces web e mobile fluidas e escaláveis. "
              "Co-fundadora da QuadCode, transformando ideias em experiências visuais completas.",
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                color: Colors.white.withOpacity(0.6),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 48),
          
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: Colors.black,
              // Botão um pouco mais compacto no mobile
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 32, 
                vertical: isMobile ? 16 : 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Ver meus projetos",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}