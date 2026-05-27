import 'package:flutter/material.dart';
import '../core/app_breakpoints.dart';
import '../widgets/section_underline.dart';

class AboutSection extends StatelessWidget {
  final bool isEnglish;

  const AboutSection({super.key, required this.isEnglish});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < AppBreakpoints.medium;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                isEnglish ? "About Me & Experience" : "Sobre Mim & Experiência",
                style: TextStyle(
                  fontSize: isMobile ? 28 : 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const SectionUnderline(),
              const SizedBox(height: 60),
              isMobile
                  ? Column(
                      children: [
                        _buildExperienceColumn(context),
                        const SizedBox(height: 60),
                        _buildSkillsColumn(context),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildExperienceColumn(context)),
                        const SizedBox(width: 80),
                        Expanded(child: _buildSkillsColumn(context)),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isEnglish ? "Journey" : "Trajetória",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 32),
        _buildTimelineItem(
          context: context,
          title: isEnglish ? "Front-End Developer" : "Desenvolvedora Front-End",
          subtitle: "QuadCode",
          period: isEnglish ? "11/2025 - Present" : "11/2025 - Atual",
          description: isEnglish
              ? "Front-end development for Web, Desktop, and Mobile applications with a focus on modern layouts and user experience."
              : "Desenvolvimento de front-end para aplicações Web, Desktop e Mobile com foco em layouts modernos e na jornada do usuário.",
          icon: Icons.work_rounded,
        ),
        const SizedBox(height: 24),
        _buildTimelineItem(
          context: context,
          title: isEnglish
              ? "Mobile Applications Developer"
              : "Desenvolvedora de Aplicativos Móveis",
          subtitle: isEnglish
              ? "Peki Code (Junior Enterprise)"
              : "Peki Code (Empresa Júnior)",
          period: "10/2024 - 02/2025",
          description: isEnglish
              ? "Focused on mobile development using the Flutter ecosystem."
              : "Atuação focada no desenvolvimento mobile utilizando o ecossistema Flutter.",
          icon: Icons.smartphone_rounded,
        ),
        const SizedBox(height: 24),
        _buildTimelineItem(
          context: context,
          title: isEnglish
              ? "Bachelor's Degree in Computer Science"
              : "Bacharelado em Ciência da Computação",
          subtitle: "IF Goiano - Campus Morrinhos",
          period: isEnglish ? "02/2019 - Present" : "02/2019 - Atual",
          description: isEnglish
              ? "Solid academic background focusing on software engineering and problem-solving."
              : "Formação acadêmica sólida com foco em engenharia de software e resolução de problemas.",
          icon: Icons.school_rounded,
        ),
      ],
    );
  }

  Widget _buildTimelineItem({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String period,
    required String description,
    required IconData icon,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: colorScheme.primary, size: 24),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "$subtitle  •  $period",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withValues(alpha: 0.6),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isEnglish ? "Technical Skills" : "Habilidades Técnicas",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _buildSkillChip(context, "Flutter"),
            _buildSkillChip(context, "Dart"),
            _buildSkillChip(context, "React"),
            _buildSkillChip(context, "JavaScript"),
            _buildSkillChip(context, "TypeScript"),
            _buildSkillChip(context, "HTML / CSS"),
            _buildSkillChip(context, "Tailwind"),
            _buildSkillChip(context, "Git / GitHub"),
          ],
        ),
        const SizedBox(height: 48),
        Text(
          isEnglish ? "Certifications & Languages" : "Certificações & Idiomas",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 24),
        _buildListTile(
          context,
          Icons.verified_rounded,
          "Jornada Dart",
          "Academia do Flutter (2025)",
        ),
        _buildListTile(
          context,
          Icons.verified_rounded,
          "Git e GitHub",
          "Curso em Vídeo (2026)",
        ),
        _buildListTile(
          context,
          Icons.language_rounded,
          isEnglish ? "English" : "Inglês",
          isEnglish ? "Intermediate Level" : "Nível Intermediário",
        ),
      ],
    );
  }

  Widget _buildSkillChip(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildListTile(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, color: Colors.white.withValues(alpha: 0.5), size: 24),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
