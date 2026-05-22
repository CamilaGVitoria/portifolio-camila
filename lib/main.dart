import 'package:flutter/material.dart';
import 'core/app_theme.dart';
import 'views/home_view.dart';

void main() {
  runApp(const PortifolioCamila());
}

class PortifolioCamila extends StatelessWidget {
  const PortifolioCamila({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camila | Front-end Developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const HomeView(),
    );
  }
}
