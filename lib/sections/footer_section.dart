import 'package:flutter/material.dart';
import '../core/app_breakpoints.dart';
import '../core/app_colors.dart';
import '../core/url_helper.dart';

class FooterSection extends StatelessWidget {
  final bool isEnglish;

  const FooterSection({super.key, required this.isEnglish});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < AppBreakpoints.medium;

    return Container(
      width: double.infinity,
      color: AppColors.footerBackground,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 32 : 120,
        vertical: 80,
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.white.withValues(alpha: 0.05),
          ),
          const SizedBox(height: 60),
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _buildFooterItems(context, colorScheme, isMobile),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildFooterItems(context, colorScheme, isMobile),
                ),
        ],
      ),
    );
  }

  List<Widget> _buildFooterItems(
    BuildContext context,
    ColorScheme colorScheme,
    bool isMobile,
  ) {
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Icon-512.png',
            height: 80,
            errorBuilder: (context, error, stackTrace) {
              return Text(
                "< Camila />",
                style: TextStyle(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1.5,
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          Text(
            isEnglish
                ? "© ${DateTime.now().year} — Developed in Flutter"
                : "© ${DateTime.now().year} — Desenvolvido em Flutter",
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.4),
              fontSize: 14,
            ),
          ),
        ],
      ),
      if (isMobile) const SizedBox(height: 40),
      Column(
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text(
            isEnglish ? "Contact" : "Contato",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          _buildContactItem(
            icon: Icons.email_rounded,
            label: "camilagvitoria.dev@gmail.com",
            url: "mailto:camilagvitoria.dev@gmail.com",
          ),
          const SizedBox(height: 12),
          _buildContactItem(
            icon: Icons.phone_rounded,
            label: "(62) 98427-3832",
            url: "tel:+5562984273832",
          ),
        ],
      ),
      if (isMobile) const SizedBox(height: 40),
      Column(
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text(
            isEnglish ? "Social Media" : "Redes Sociais",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: isMobile
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              _buildSocialButton(
                icon: Icons.code_rounded,
                label: "GitHub",
                url: "https://github.com/CamilaGVitoria",
              ),
              const SizedBox(height: 12),
              _buildSocialButton(
                icon: Icons.business_center_rounded,
                label: "LinkedIn",
                url: "https://www.linkedin.com/in/camilagvitoria/",
              ),
            ],
          ),
        ],
      ),
    ];
  }

  Widget _buildContactItem({
    required IconData icon,
    required String label,
    required String url,
  }) {
    return GestureDetector(
      onTap: () => launchExternalUrl(url),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.primary, size: 18),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.6),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required String url,
  }) {
    return GestureDetector(
      onTap: () => launchExternalUrl(url),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.primary, size: 18),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.6),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
