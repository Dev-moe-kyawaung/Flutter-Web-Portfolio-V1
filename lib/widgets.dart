import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'theme.dart';

class CyberBackground extends StatelessWidget {
  const CyberBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          CustomPaint(size: Size.infinite, painter: GridPainter()),
          Container(color: Colors.black.withOpacity(0.15)),
          const Scanlines(),
          const GlowOrbs(),
        ],
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.cyan.withOpacity(0.06)
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

class Scanlines extends StatelessWidget {
  const Scanlines({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.03),
            Colors.transparent,
            Colors.white.withOpacity(0.03),
          ],
          stops: const [0.0, 0.5, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.repeated,
        ),
        backgroundBlendMode: BlendMode.screen,
      ),
    );
  }
}

class GlowOrbs extends StatefulWidget {
  const GlowOrbs({super.key});

  @override
  State<GlowOrbs> createState() => _GlowOrbsState();
}

class _GlowOrbsState extends State<GlowOrbs> with SingleTickerProviderStateMixin {
  late AnimationController c;

  @override
  void initState() {
    super.initState();
    c = AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat();
  }

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: c,
      builder: (_, __) {
        final t = c.value * 2 * pi;
        return Stack(
          children: [
            _orb(0.18 + sin(t) * 0.04, 0.18 + cos(t) * 0.04, AppColors.cyan),
            _orb(0.82 + cos(t) * 0.03, 0.22 + sin(t) * 0.05, AppColors.pink),
            _orb(0.55 + sin(t) * 0.05, 0.78 + cos(t) * 0.03, AppColors.yellow),
          ],
        );
      },
    );
  }

  Widget _orb(double x, double y, Color color) {
    return Positioned(
      left: MediaQuery.of(context).size.width * x - 70,
      top: MediaQuery.of(context).size.height * y - 70,
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(colors: [color.withOpacity(0.6), color.withOpacity(0.0)]),
        ),
      ),
    );
  }
}

class SectionShell extends StatelessWidget {
  final String label;
  final String title;
  final Widget child;
  const SectionShell({super.key, required this.label, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 34),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: AppColors.cyan, letterSpacing: 2)),
            const SizedBox(height: 10),
            ShaderMask(
              shaderCallback: (_) => gradientNeon.createShader(const Rect.fromLTWH(0, 0, 900, 120)),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 44,
                  height: 1.05,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 22),
            child,
          ],
        ),
      ),
    );
  }
}

class NeonButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData icon;
  const NeonButton({super.key, required this.text, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        decoration: BoxDecoration(
          gradient: gradientNeon,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [BoxShadow(color: AppColors.cyan.withOpacity(0.3), blurRadius: 20)],
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 18, color: Colors.black),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w800)),
        ]),
      ),
    );
  }
}

class GlassPanel extends StatelessWidget {
  final Widget child;
  const GlassPanel({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AngularFrameClipper(),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.panel.withOpacity(0.86),
          border: Border.all(color: AppColors.border),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 14))],
        ),
        child: child,
      ),
    );
  }
}

class AngularFrameClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size s) {
    const c = 18.0;
    return Path()
      ..moveTo(c, 0)
      ..lineTo(s.width - c, 0)
      ..lineTo(s.width, c)
      ..lineTo(s.width, s.height - c)
      ..lineTo(s.width - c, s.height)
      ..lineTo(c, s.height)
      ..lineTo(0, s.height - c)
      ..lineTo(0, c)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

Future<void> openUrl(String url) async {
  final uri = Uri.parse(url);
  await launchUrl(uri, mode: LaunchMode.platformDefault);
}

class TypingText extends StatefulWidget {
  final List<String> roles;
  const TypingText({super.key, required this.roles});

  @override
  State<TypingText> createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText> {
  int role = 0;
  int char = 0;
  bool back = false;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 80), (_) {
      final current = widget.roles[role];
      setState(() {
        if (!back) {
          char++;
          if (char >= current.length) {
            back = true;
            Future.delayed(const Duration(milliseconds: 900), () {});
          }
        } else {
          char--;
          if (char <= 0) {
            back = false;
            role = (role + 1) % widget.roles.length;
          }
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = widget.roles[role].substring(0, max(0, min(char, widget.roles[role].length)));
    return Text(
      '$text|',
      style: const TextStyle(color: AppColors.yellow, fontSize: 22, fontWeight: FontWeight.w700),
    );
  }
}
