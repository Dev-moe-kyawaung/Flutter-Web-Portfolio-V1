import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../app_data.dart';
import '../widgets/section_shell.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      ('Kotlin / Android', 0.95),
      ('Flutter / Dart', 0.90),
      ('Jetpack Compose', 0.92),
      ('Firebase / REST', 0.88),
      ('Cybersecurity', 0.80),
      ('AI / ML', 0.78),
    ];

    return SectionShell(
      label: 'Tech Stack',
      title: 'Skills & Technologies',
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: AppData.focus
                  .map(
                    (f) => Container(
                      padding: const EdgeInsets.all(14),
                      width: 280,
                      decoration: BoxDecoration(
                        color: AppTheme.panel2,
                        border: Border.all(color: AppTheme.border),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(f['name']!, style: const TextStyle(color: AppTheme.yellow, fontWeight: FontWeight.w800)),
                          const SizedBox(height: 6),
                          Text(f['desc']!, style: const TextStyle(color: AppTheme.text, height: 1.5)),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 22),
            ...skills.map(
              (s) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _SkillBar(name: s.$1, value: s.$2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillBar extends StatelessWidget {
  final String name;
  final double value;
  const _SkillBar({required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.bg.withOpacity(0.25),
        border: Border.all(color: AppTheme.border),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: const TextStyle(color: AppTheme.text, fontWeight: FontWeight.w700)),
              Text('${(value * 100).round()}%', style: const TextStyle(color: AppTheme.yellow)),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: value),
              duration: const Duration(milliseconds: 1200),
              builder: (_, v, __) {
                return LinearProgressIndicator(
                  value: v,
                  minHeight: 10,
                  backgroundColor: Colors.white12,
                  valueColor: const AlwaysStoppedAnimation(AppTheme.cyan),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
