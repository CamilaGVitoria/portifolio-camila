import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 40,
        vertical: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Meus Projetos",
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _buildProjectCard(
                context: context,
                isMobile: isMobile,
                title: "BioTrack",
                description:
                    "Plataforma de telemonitoramento clínico. Desenvolvimento completo da interface front-end, focando em usabilidade e experiência fluida para os usuários.",
                linkText: "biotrack.app.br",
                url: "https://biotrack.app.br",
                icon: Icons.health_and_safety,
              ),
              _buildProjectCard(
                context: context,
                isMobile: isMobile,
                title: "Nutricionista Talita Gonçalves",
                description:
                    "Landing page profissional desenvolvida para conversão de pacientes, com layout moderno, responsivo e otimizado para a web.",
                linkText: "talitagoncalvesnutri.com.br",
                url: "https://www.talitagoncalvesnutri.com.br",
                icon: Icons.restaurant_menu,
              ),
              _buildProjectCard(
                context: context,
                isMobile: isMobile,
                title: "Portfólio Pessoal",
                description:
                    "Este próprio site! Desenvolvido 100% em Flutter Web aplicando conceitos de Clean Code, responsividade e componentização.",
                linkText: "Ver no GitHub",
                url: "https://github.com/CamilaGVitoria/portifolio-camila",
                icon: Icons.code,
              ),
              _buildProjectCard(
                context: context,
                isMobile: isMobile,
                title: "Experimentos Mobile",
                description:
                    "Coleção de aplicativos mobile desenvolvidos em Flutter focando na construção de layouts avançados, componentização e consumo de dados no front-end.",
                linkText: "Ver repositório",
                url:
                    "https://github.com/CamilaGVitoria/apps",
                icon: Icons.app_shortcut_rounded,
              ),
              _buildProjectCard(
                context: context,
                isMobile: isMobile,
                title: "Novas Soluções",
                description:
                    "Interfaces modernas e aplicações responsivas estão sendo estruturadas neste momento. O desenvolvimento não para.",
                linkText: "Em andamento...",
                url: "",
                icon: Icons.hourglass_top_rounded,
                isInProgress: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, webOnlyWindowName: '_blank');
    } else {
      debugPrint("Não foi possível abrir o link: $urlString");
    }
  }

  Widget _buildProjectCard({
    required BuildContext context,
    required bool isMobile,
    required String title,
    required String description,
    required String linkText,
    required String url,
    required IconData icon,
    bool isInProgress = false,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Opacity(
      opacity: isInProgress ? 0.5 : 1.0,
      child: Container(
        width: isMobile ? double.infinity : 350,
        height: isMobile ? null : 320,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isInProgress
                ? colorScheme.primary.withOpacity(0.2)
                : Colors.white.withOpacity(0.05),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: colorScheme.primary, size: 32),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.6),
                height: 1.5,
              ),
            ),
            if (!isMobile) const Spacer(),
            if (isMobile) const SizedBox(height: 24),
            GestureDetector(
              onTap: isInProgress ? null : () => _launchUrl(url),
              child: MouseRegion(
                cursor: isInProgress
                    ? SystemMouseCursors.basic
                    : SystemMouseCursors.click,
                child: Row(
                  children: [
                    Text(
                      linkText,
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (!isInProgress)
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: colorScheme.primary,
                        size: 16,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
