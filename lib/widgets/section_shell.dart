import 'package:flutter/material.dart';
import '../app_theme.dart';
import 'cyber_clipper.dart';

class SectionShell extends StatelessWidget {
  final String label;
  final String title;
  final Widget child;

  const SectionShell({
    super.key,
    required this.label,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1240),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: AppTheme.cyan, letterSpacing: 2)),
            const SizedBox(height: 10),
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (rect) => AppTheme.heroGradient.createShader(rect),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 44,
                  height: 1.04,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 22),
            ClipPath(
              clipper: CyberClipper(),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.panel.withOpacity(0.72),
                  border: Border.all(color: AppTheme.border),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.cyan.withOpacity(0.10),
                      blurRadius: 24,
                      offset: const Offset(0, 16),
                    ),
                  ],
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
