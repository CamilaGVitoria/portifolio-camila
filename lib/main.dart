import 'package:flutter/material.dart';
import 'package:portifolio_camila/views/home_view.dart';

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
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(
          primary: Colors.orange,
          secondary: Colors.orangeAccent,
          surface: Color(0xFF1A1A1A),
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const HomeView(),
    );
  }
}