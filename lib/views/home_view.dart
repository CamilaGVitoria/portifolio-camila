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

  bool isEnglish = false; 

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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!isMobile) ...[
                        _buildMenuButton(isEnglish ? "About Me" : "Sobre Mim", _aboutKey),
                        const SizedBox(width: 24),
                        _buildMenuButton(isEnglish ? "Projects" : "Projetos", _projectsKey),
                        const SizedBox(width: 32),
                      ],
                      _buildLanguageToggle(),
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
              Container(
                key: _heroKey, 
                child: HeroSection(
                  isEnglish: isEnglish,
                  onViewProjectsPressed: () => _scrollToSection(_projectsKey),
                ),
              ),
              Container(key: _aboutKey, child: AboutSection(isEnglish: isEnglish)),
              Container(key: _projectsKey, child: ProjectsSection(isEnglish: isEnglish)),
              FooterSection(isEnglish: isEnglish),
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

  Widget _buildLanguageToggle() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildLangOption("PT", !isEnglish),
          _buildLangOption("EN", isEnglish),
        ],
      ),
    );
  }

  Widget _buildLangOption(String lang, bool isActive) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isEnglish = lang == "EN";
        });
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isActive ? Colors.orange.withOpacity(0.2) : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            lang,
            style: TextStyle(
              color: isActive ? Colors.orange : Colors.white.withOpacity(0.5),
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}