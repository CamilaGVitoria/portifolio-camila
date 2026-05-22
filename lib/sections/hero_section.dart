import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, webOnlyWindowName: '_blank');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    const contentAlignment = CrossAxisAlignment.center;
    const textAlignment = TextAlign.center;

    Widget profileImage = ClipOval(
      child: Image.asset(
        'assets/images/Camila.jpg',
        width: isMobile ? 140 : 220,
        height: isMobile ? 140 : 220,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: isMobile ? 140 : 220,
            height: isMobile ? 140 : 220,
            decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person_rounded,
              color: colorScheme.primary,
              size: isMobile ? 60 : 100,
            ),
          );
        },
      ),
    );

    Widget textContent = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: contentAlignment,
      children: [
        Text(
          "Olá, eu sou a Camila",
          style: TextStyle(
            fontSize: isMobile ? 22 : 28,
            color: Colors.white.withOpacity(0.8),
          ),
          textAlign: textAlignment,
        ),
        const SizedBox(height: 16),
        SelectableText(
          "Desenvolvedora Front-end",
          style: TextStyle(
            fontSize: isMobile ? 36 : 56,
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
            letterSpacing: isMobile ? 1.0 : 2.0,
          ),
          textAlign: textAlignment,
        ),
        const SizedBox(height: 24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: SelectableText.rich(
            TextSpan(
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                color: Colors.white.withOpacity(0.6),
                height: 1.5,
              ),
              children: [
                const TextSpan(
                  text:
                      "Especializada em criar interfaces web e mobile fluidas e escaláveis. Co-fundadora da ",
                ),
                TextSpan(
                  text: "QuadCode",
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => _launchUrl("https://quadcode.com.br"),
                ),
                const TextSpan(
                  text:
                      ", transformando ideias em experiências visuais completas.",
                ),
              ],
            ),
            textAlign: textAlignment,
          ),
        ),
        const SizedBox(height: 48),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: Colors.black,
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
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 120,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isMobile
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    profileImage,
                    const SizedBox(height: 40),
                    textContent,
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize
                      .min, // Garante que a linha ocupe apenas o espaço necessário
                  children: [
                    profileImage,
                    const SizedBox(width: 60),
                    Flexible(child: textContent),
                  ],
                ),
        ),
      ),
    );
  }
}
