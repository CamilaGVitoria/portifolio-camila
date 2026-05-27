import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchExternalUrl(String urlString) async {
  final Uri url = Uri.parse(urlString);
  try {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } catch (e) {
    debugPrint('Não foi possível abrir: $urlString — $e');
  }
}
