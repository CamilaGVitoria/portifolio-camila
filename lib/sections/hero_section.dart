import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../core/app_breakpoints.dart';
import '../core/url_helper.dart';

class HeroSection extends StatefulWidget {
  final bool isEnglish;
  final VoidCallback onViewProjectsPressed;

  const HeroSection({
    super.key,
    required this.isEnglish,
    required this.onViewProjectsPressed,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  late final TapGestureRecognizer _quadCodeRecognizer;

  @override
  void initState() {
    super.initState();
    _quadCodeRecognizer = TapGestureRecognizer()
      ..onTap = () => launchExternalUrl("https://quadcode.com.br");
  }

  @override
  void dispose() {
    _quadCodeRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < AppBreakpoints.medium;

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
              color: colorScheme.primary.withValues(alpha: 0.1),
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
          widget.isEnglish ? "Hi, I'm Camila" : "Olá, eu sou a Camila",
          style: TextStyle(
            fontSize: isMobile ? 22 : 28,
            color: Colors.white.withValues(alpha: 0.8),
          ),
          textAlign: textAlignment,
        ),
        const SizedBox(height: 16),
        SelectableText(
          widget.isEnglish ? "Front-end Developer" : "Desenvolvedora Front-end",
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
                color: Colors.white.withValues(alpha: 0.6),
                height: 1.5,
              ),
              children: [
                TextSpan(
                  text: widget.isEnglish
                      ? "Specialized in creating fluid and scalable web and mobile interfaces. Co-founder of "
                      : "Especializada em criar interfaces web e mobile fluidas e escaláveis. Co-fundadora da ",
                ),
                TextSpan(
                  text: "QuadCode",
                  style: TextStyle(
                    color: colorScheme.tertiary,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: _quadCodeRecognizer,
                ),
                TextSpan(
                  text: widget.isEnglish
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
          onPressed: widget.onViewProjectsPressed,
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
            widget.isEnglish ? "View my projects" : "Ver meus projetos",
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
