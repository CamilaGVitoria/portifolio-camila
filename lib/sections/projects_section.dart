import 'package:flutter/material.dart';
import '../core/app_breakpoints.dart';
import '../core/url_helper.dart';
import '../widgets/section_underline.dart';

class ProjectsSection extends StatelessWidget {
  final bool isEnglish;

  const ProjectsSection({super.key, required this.isEnglish});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < AppBreakpoints.medium;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 60,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                isEnglish ? "My Projects" : "Meus Projetos",
                style: TextStyle(
                  fontSize: isMobile ? 28 : 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const SectionUnderline(),
              const SizedBox(height: 48),
              LayoutBuilder(
                builder: (context, constraints) {
                  final availableWidth = constraints.maxWidth;
                  const spacing = 24.0;
                  int columns = (availableWidth / 350).floor().clamp(1, 3);
                  final cardWidth =
                      (availableWidth - (spacing * (columns - 1))) / columns;

                  return Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    alignment: WrapAlignment.center,
                    children: [
                      _ProjectCard(
                        cardWidth: cardWidth,
                        isMobile: columns == 1,
                        title: "TrackFlow",
                        description: isEnglish
                            ? "Clinical telemonitoring platform. Full development of the front-end interface, focusing on usability and a fluid user experience."
                            : "Plataforma de telemonitoramento clínico. Desenvolvimento completo da interface front-end, focando em usabilidade e experiência fluida para os usuários.",
                        linkText: "trackflow.net.br",
                        url: "https://trackflow.net.br",
                        icon: Icons.health_and_safety,
                      ),
                      _ProjectCard(
                        cardWidth: cardWidth,
                        isMobile: columns == 1,
                        title: isEnglish
                            ? "Nutritionist Talita Gonçalves"
                            : "Nutricionista Talita Gonçalves",
                        description: isEnglish
                            ? "Professional landing page developed for patient conversion, featuring a modern, responsive, and web-optimized layout."
                            : "Landing page profissional desenvolvida para conversão de pacientes, com layout moderno, responsivo e otimizado para a web.",
                        linkText: "talitagoncalvesnutri.com.br",
                        url: "https://www.talitagoncalvesnutri.com.br",
                        icon: Icons.restaurant_menu,
                      ),
                      _ProjectCard(
                        cardWidth: cardWidth,
                        isMobile: columns == 1,
                        title: isEnglish
                            ? "Personal Portfolio"
                            : "Portfólio Pessoal",
                        description: isEnglish
                            ? "This very website! Developed 100% in Flutter Web applying Clean Code concepts, responsiveness, and componentization."
                            : "Este próprio site! Desenvolvido 100% em Flutter Web aplicando conceitos de Clean Code, responsividade e componentização.",
                        linkText: isEnglish
                            ? "View on GitHub"
                            : "Ver no GitHub",
                        url:
                            "https://github.com/CamilaGVitoria/portifolio-camila",
                        icon: Icons.code,
                      ),
                      _ProjectCard(
                        cardWidth: cardWidth,
                        isMobile: columns == 1,
                        title: isEnglish
                            ? "Mobile Experiments"
                            : "Experimentos Mobile",
                        description: isEnglish
                            ? "Collection of mobile applications developed in Flutter focusing on building advanced layouts, componentization, and front-end data consumption."
                            : "Coleção de aplicativos mobile desenvolvidos em Flutter focando na construção de layouts avançados, componentização e consumo de dados no front-end.",
                        linkText: isEnglish
                            ? "View repository"
                            : "Ver repositório",
                        url: "https://github.com/CamilaGVitoria/apps",
                        icon: Icons.app_shortcut_rounded,
                      ),
                      _ProjectCard(
                        cardWidth: cardWidth,
                        isMobile: columns == 1,
                        title: isEnglish ? "New Solutions" : "Novas Soluções",
                        description: isEnglish
                            ? "Modern interfaces and responsive applications are currently being structured. Development never stops."
                            : "Interfaces modernas e aplicações responsivas estão sendo estruturadas neste momento. O desenvolvimento não para.",
                        linkText: isEnglish
                            ? "In progress..."
                            : "Em andamento...",
                        url: "",
                        icon: Icons.hourglass_top_rounded,
                        isInProgress: true,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final double cardWidth;
  final bool isMobile;
  final String title;
  final String description;
  final String linkText;
  final String url;
  final IconData icon;
  final bool isInProgress;

  const _ProjectCard({
    required this.cardWidth,
    required this.isMobile,
    required this.title,
    required this.description,
    required this.linkText,
    required this.url,
    required this.icon,
    this.isInProgress = false,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final showHover = _isHovered && !widget.isInProgress;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Opacity(
        opacity: widget.isInProgress ? 0.5 : 1.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.isMobile ? double.infinity : widget.cardWidth,
          height: widget.isMobile ? null : 320,
          padding: const EdgeInsets.all(24),
          transform: showHover
              ? Matrix4.translationValues(0.0, -4.0, 0.0)
              : Matrix4.identity(),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: showHover
                  ? colorScheme.primary.withValues(alpha: 0.3)
                  : widget.isInProgress
                  ? colorScheme.primary.withValues(alpha: 0.2)
                  : Colors.white.withValues(alpha: 0.05),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(widget.icon, color: colorScheme.primary, size: 32),
              const SizedBox(height: 16),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.description,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withValues(alpha: 0.6),
                  height: 1.5,
                ),
              ),
              if (!widget.isMobile) const Spacer(),
              if (widget.isMobile) const SizedBox(height: 24),
              Semantics(
                label: widget.isInProgress
                    ? widget.linkText
                    : 'Abrir ${widget.title}',
                button: !widget.isInProgress,
                child: GestureDetector(
                  onTap: widget.isInProgress
                      ? null
                      : () => launchExternalUrl(widget.url),
                  child: MouseRegion(
                    cursor: widget.isInProgress
                        ? SystemMouseCursors.basic
                        : SystemMouseCursors.click,
                    child: Row(
                      children: [
                        Text(
                          widget.linkText,
                          style: TextStyle(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (!widget.isInProgress)
                          Icon(
                            Icons.arrow_forward_rounded,
                            color: colorScheme.primary,
                            size: 16,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
