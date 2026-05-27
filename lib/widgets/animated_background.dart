import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  const AnimatedBackground({super.key, required this.child});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Listenable _repaintListenable;
  final List<_Particle> _particles = [];
  final Random _random = Random();
  final ValueNotifier<Offset> _mousePosition = ValueNotifier(Offset.zero);
  Size _screenSize = Size.zero;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 40; i++) {
      _particles.add(
        _Particle(
          x: _random.nextDouble(),
          y: _random.nextDouble(),
          speedX: (_random.nextDouble() - 0.5) * 0.002,
          speedY: (_random.nextDouble() - 0.5) * 0.002,
          radius: _random.nextDouble() * 2 + 1.5,
          opacity: _random.nextDouble() * 0.5 + 0.2,
        ),
      );
    }

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..addListener(() {
            if (_screenSize != Size.zero) {
              for (var particle in _particles) {
                particle.update(_mousePosition.value, _screenSize);
              }
            }
          })
          ..repeat();

    _repaintListenable = Listenable.merge([_controller, _mousePosition]);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenSize = MediaQuery.of(context).size;
  }

  @override
  void dispose() {
    _controller.dispose();
    _mousePosition.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => _mousePosition.value = event.localPosition,
      onExit: (event) => _mousePosition.value = Offset.zero,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: _ParticlePainter(
                _particles,
                Theme.of(context).colorScheme.primary,
                _mousePosition,
                repaint: _repaintListenable,
              ),
            ),
          ),
          RepaintBoundary(child: widget.child),
        ],
      ),
    );
  }
}

class _Particle {
  double x;
  double y;
  double speedX;
  double speedY;
  double radius;
  double opacity;

  _Particle({
    required this.x,
    required this.y,
    required this.speedX,
    required this.speedY,
    required this.radius,
    required this.opacity,
  });

  void update(Offset mousePos, Size size) {
    x += speedX;
    y += speedY;

    if (x < 0) x = 1;
    if (x > 1) x = 0;
    if (y < 0) y = 1;
    if (y > 1) y = 0;

    if (mousePos != Offset.zero && size.width > 0) {
      final px = x * size.width;
      final py = y * size.height;
      final dx = mousePos.dx - px;
      final dy = mousePos.dy - py;
      final distance = sqrt(dx * dx + dy * dy);

      if (distance < 120) {
        x -= (dx * 0.00005) / size.width * (120 - distance);
        y -= (dy * 0.00005) / size.height * (120 - distance);
      }
    }
  }
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;
  final Color color;
  final ValueNotifier<Offset> mousePosition;

  _ParticlePainter(
    this.particles,
    this.color,
    this.mousePosition, {
    required Listenable repaint,
  }) : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    final mp = mousePosition.value;

    for (var particle in particles) {
      final px = particle.x * size.width;
      final py = particle.y * size.height;

      final paint = Paint()
        ..color = color.withValues(alpha: particle.opacity)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(Offset(px, py), particle.radius, paint);

      if (mp != Offset.zero) {
        final dx = mp.dx - px;
        final dy = mp.dy - py;
        final distance = sqrt(dx * dx + dy * dy);

        if (distance < 150) {
          final lineOpacity = (1 - (distance / 150)) * particle.opacity;
          final linePaint = Paint()
            ..color = color.withValues(alpha: lineOpacity)
            ..strokeWidth = 1.0;
          canvas.drawLine(Offset(px, py), mp, linePaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
