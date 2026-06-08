import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../app_data.dart';
import '../widgets/section_shell.dart';

class AppsSection extends StatelessWidget {
  const AppsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      label: 'App Collection',
      title: 'Built Apps',
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: AppData.apps
              .map(
                (app) => Chip(
                  label: Text(app),
                  backgroundColor: AppTheme.panel2,
                  side: const BorderSide(color: AppTheme.border),
                  labelStyle: const TextStyle(color: AppTheme.text),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
