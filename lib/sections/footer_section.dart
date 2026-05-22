import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

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
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      color: const Color(0xFF0D0D0D),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 32 : 120,
        vertical: 80,
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.white.withOpacity(0.05),
          ),
          const SizedBox(height: 60),
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _buildFooterItems(context, colorScheme),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildFooterItems(context, colorScheme),
                ),
        ],
      ),
    );
  }

  List<Widget> _buildFooterItems(BuildContext context, ColorScheme colorScheme) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/my_logo.png',
            height: 110,
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
            "© ${DateTime.now().year} — Desenvolvido em Flutter",
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
              fontSize: 14,
            ),
          ),
        ],
      ),
      if (isMobile) const SizedBox(height: 40),
      Column(
        crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          const Text(
            "Contato",
            style: TextStyle(
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
        crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          const Text(
            "Redes Sociais",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
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
      onTap: () => _launchUrl(url),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.orange, size: 18),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
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
      onTap: () => _launchUrl(url),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.orange, size: 18),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
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