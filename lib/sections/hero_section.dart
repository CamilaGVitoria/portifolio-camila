import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  final bool isEnglish;
  final VoidCallback onViewProjectsPressed;

  const HeroSection({
    super.key,
    required this.isEnglish,
    required this.onViewProjectsPressed,
  });

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
          isEnglish ? "Hi, I'm Camila" : "Olá, eu sou a Camila",
          style: TextStyle(
            fontSize: isMobile ? 22 : 28,
            color: Colors.white.withOpacity(0.8),
          ),
          textAlign: textAlignment,
        ),
        const SizedBox(height: 16),
        SelectableText(
          isEnglish ? "Front-end Developer" : "Desenvolvedora Front-end",
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
                TextSpan(
                  text: isEnglish
                      ? "Specialized in creating fluid and scalable web and mobile interfaces. Co-founder of "
                      : "Especializada em criar interfaces web e mobile fluidas e escaláveis. Co-fundadora da ",
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
                TextSpan(
                  text: isEnglish
                      ? ", turning ideas into complete visual experiences."
                      : ", transformando ideias em experiências visuais completas.",
                ),
              ],
            ),
            textAlign: textAlignment,
          ),
        ),
        const SizedBox(height: 48),
        ElevatedButton(
          onPressed: onViewProjectsPressed,
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
          child: Text(
            isEnglish ? "View my projects" : "Ver meus projetos",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  mainAxisSize: MainAxisSize.min,
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
