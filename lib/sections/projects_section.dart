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
                        previewImage: "assets/images/projects/trackflow.jpg",
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
                        previewImage: "assets/images/projects/talita.jpg",
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
                        title: "MCU Collector",
                        description: isEnglish
                            ? "Web and mobile app that turns the passion for Marvel into an interactive sticker album. Track, organize, and complete a digital collection of MCU characters."
                            : "Aplicação web e mobile que transforma a paixão pela Marvel em um álbum de figurinhas interativo. Rastreie, organize e complete sua coleção digital de personagens do MCU.",
                        icon: Icons.stars_outlined,
                        previewImage:
                            "assets/images/projects/mcu_collector.jpg",
                        links: [
                          MapEntry(
                            "GitHub",
                            "https://github.com/CamilaGVitoria/mcu_collector",
                          ),
                          MapEntry(
                            isEnglish ? "Website" : "Site Web",
                            "https://mcu-collector.netlify.app",
                          ),
                          MapEntry(
                            "Download APK",
                            "https://github.com/CamilaGVitoria/mcu_collector/releases/tag/v1.0.0",
                          ),
                        ],
                      ),
                      _ProjectCard(
                        cardWidth: cardWidth,
                        isMobile: columns == 1,
                        title: isEnglish
                            ? "Landing Page — Front-end Challenge"
                            : "Landing Page — Desafio Front-end",
                        description: isEnglish
                            ? "Project developed as a Front-end technical challenge, using fictional data and visual identity for study and portfolio purposes."
                            : "Projeto desenvolvido como desafio técnico de Front-end, utilizando dados e identidade visual fictícios para fins de estudo e portfólio.",
                        linkText: isEnglish ? "View Website" : "Acessar site",
                        url:
                            "https://desafio-frontend-camila-goncalves.netlify.app",
                        icon: Icons.web_rounded,
                        previewImage:
                            "assets/images/projects/desafio_frontend.jpg",
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
  final List<MapEntry<String, String>>? links;
  final String? previewImage;

  const _ProjectCard({
    required this.cardWidth,
    required this.isMobile,
    required this.title,
    required this.description,
    this.linkText = '',
    this.url = '',
    required this.icon,
    this.isInProgress = false,
    this.links,
    this.previewImage,
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
          height: widget.isMobile ? null : 400,
          clipBehavior: Clip.antiAlias,
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(colorScheme, showHover),
              _expandIfDesktop(
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      if (widget.links != null)
                        ...widget.links!.map(
                          (link) => Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Semantics(
                              label: 'Abrir ${link.key}',
                              button: true,
                              child: GestureDetector(
                                onTap: () => launchExternalUrl(link.value),
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Row(
                                    children: [
                                      Icon(
                                        link.key.contains('GitHub')
                                            ? Icons.code
                                            : link.key.contains('Download') ||
                                                  link.key.contains('APK')
                                            ? Icons.download_rounded
                                            : Icons.language,
                                        color: colorScheme.primary,
                                        size: 14,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        link.key,
                                        style: TextStyle(
                                          color: colorScheme.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Icon(
                                        Icons.arrow_forward_rounded,
                                        color: colorScheme.primary,
                                        size: 14,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      else
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _expandIfDesktop(Widget child) =>
      widget.isMobile ? child : Expanded(child: child);

  Widget _buildHeader(ColorScheme colorScheme, bool showHover) {
    return SizedBox(
      height: 150,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (widget.previewImage != null)
            AnimatedScale(
              scale: showHover ? 1.06 : 1.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              child: Image.asset(
                widget.previewImage!,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                filterQuality: FilterQuality.medium,
                semanticLabel: 'Preview de ${widget.title}',
              ),
            )
          else
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colorScheme.primary.withValues(alpha: 0.18),
                    colorScheme.surface,
                  ],
                ),
              ),
            ),
          // Overlay para garantir legibilidade do ícone e título
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.55, 1.0],
                colors: [
                  Colors.black.withValues(alpha: 0.1),
                  colorScheme.surface.withValues(alpha: 0.7),
                  colorScheme.surface,
                ],
              ),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(widget.icon, color: colorScheme.primary, size: 32),
                const SizedBox(height: 10),
                Text(
                  widget.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(color: Colors.black54, blurRadius: 8)],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
