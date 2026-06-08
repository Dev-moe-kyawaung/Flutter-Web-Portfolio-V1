import 'dart:math';
import 'package:flutter/material.dart';
import '../app_theme.dart';

class CyberBackground extends StatelessWidget {
  const CyberBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        fit: StackFit.expand,
        children: const [
          _GridLayer(),
          _OrbLayer(),
          _Scanlines(),
        ],
      ),
    );
  }
}

class _GridLayer extends StatelessWidget {
  const _GridLayer();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _GridPainter(),
      size: Size.infinite,
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.cyan.withOpacity(0.07)
      ..strokeWidth = 1;

    const gap = 36.0;
    for (double x = 0; x < size.width; x += gap) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += gap) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _OrbLayer extends StatefulWidget {
  const _OrbLayer();

  @override
  State<_OrbLayer> createState() => _OrbLayerState();
}

class _OrbLayerState extends State<_OrbLayer> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 10))
      ..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final t = controller.value * pi * 2;
        final size = MediaQuery.of(context).size;
        return Stack(
          children: [
            _orb(size, 0.16 + sin(t) * 0.04, 0.16 + cos(t) * 0.03, AppTheme.cyan),
            _orb(size, 0.82 + cos(t) * 0.03, 0.24 + sin(t) * 0.05, AppTheme.pink),
            _orb(size, 0.54 + sin(t) * 0.05, 0.80 + cos(t) * 0.03, AppTheme.yellow),
          ],
        );
      },
    );
  }

  Widget _orb(Size size, double fx, double fy, Color color) {
    return Positioned(
      left: size.width * fx - 80,
      top: size.height * fy - 80,
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [color.withOpacity(0.45), color.withOpacity(0.0)],
          ),
        ),
      ),
    );
  }
}

class _Scanlines extends StatelessWidget {
  const _Scanlines();

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.18,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.04),
              Colors.transparent,
              Colors.white.withOpacity(0.04),
            ],
            stops: const [0.0, 0.5, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}
