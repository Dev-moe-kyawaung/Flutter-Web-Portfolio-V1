import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../app_data.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1240),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppTheme.panel.withOpacity(0.75),
            border: Border.all(color: AppTheme.border),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppData.tagline, style: const TextStyle(color: AppTheme.text)),
              const Text('Flutter Pro Max Portfolio', style: TextStyle(color: AppTheme.cyan)),
            ],
          ),
        ),
      ),
    );
  }
}
