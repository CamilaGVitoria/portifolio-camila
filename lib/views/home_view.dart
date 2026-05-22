import 'package:flutter/material.dart';
import '../sections/about_section.dart';
import '../sections/footer_section.dart';
import '../sections/hero_section.dart';
import '../sections/projects_section.dart';
import '../widgets/animated_background.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => _scrollToSection(_heroKey),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Image.asset(
                        'assets/images/my_logo.png',
                        height: 48,
                        errorBuilder: (context, error, stackTrace) {
                          return const Text(
                            '< Camila />',
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  if (!isMobile)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildMenuButton("Sobre Mim", _aboutKey),
                        const SizedBox(width: 24),
                        _buildMenuButton("Projetos", _projectsKey),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: AnimatedBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(key: _heroKey, child: const HeroSection()),
              Container(key: _aboutKey, child: const AboutSection()),
              Container(key: _projectsKey, child: const ProjectsSection()),
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(String title, GlobalKey key) {
    return TextButton(
      onPressed: () => _scrollToSection(key),
      style: TextButton.styleFrom(
        foregroundColor: Colors.orange,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(title),
    );
  }
}