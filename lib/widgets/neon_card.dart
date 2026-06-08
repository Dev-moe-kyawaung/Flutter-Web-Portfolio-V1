import 'package:flutter/material.dart';
import '../app_theme.dart';
import 'cyber_clipper.dart';

class NeonCard extends StatelessWidget {
  final Widget child;
  final int index;
  const NeonCard({super.key, required this.child, required this.index});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CyberClipper(),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.panel2.withOpacity(0.8),
          border: Border.all(color: AppTheme.border),
          boxShadow: [
            BoxShadow(
              color: AppTheme.cardGradient(index).colors.first.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
