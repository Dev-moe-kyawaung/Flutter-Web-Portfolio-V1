import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../app_data.dart';
import '../widgets/animated_counter.dart';
import '../widgets/section_shell.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      label: 'About',
      title: 'Developer by passion,
learner by nature.',
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: LayoutBuilder(
          builder: (context, c) {
            final mobile = c.maxWidth < 920;
            return Wrap(
              spacing: 22,
              runSpacing: 22,
              children: [
                SizedBox(
                  width: mobile ? c.maxWidth : c.maxWidth * 0.58,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'I create premium app experiences with clean structure, strong UX, and a cyber-modern presentation style.',
                        style: TextStyle(color: AppTheme.text, fontSize: 16, height: 1.8),
                      ),
                      SizedBox(height: 14),
                      Text(
                        'My work spans Android, Flutter, Firebase, REST APIs, security, and AI/ML experiments — built to look sharp and behave smoothly.',
                        style: TextStyle(color: AppTheme.text, fontSize: 16, height: 1.8),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mobile ? c.maxWidth : c.maxWidth * 0.34,
                  child: Column(
                    children: [
                      _AboutCard(
                        title: 'Profile',
                        child: Column(
                          children: const [
                            _InfoRow('Name', AppData.nameEn),
                            _InfoRow('Role', AppData.title),
                            _InfoRow('Location', AppData.location),
                            _InfoRow('Tagline', AppData.tagline),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      _AboutCard(
                        title: 'Counter',
                        child: Wrap(
                          spacing: 14,
                          runSpacing: 14,
                          children: const [
                            _CounterBox(label: 'Certificates', target: 82),
                            _CounterBox(label: 'Apps', target: 16),
                            _CounterBox(label: 'Languages', target: 3),
                            _CounterBox(label: 'Focus', target: 4),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _AboutCard extends StatelessWidget {
  final String title;
  final Widget child;
  const _AboutCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppTheme.panel2,
        border: Border.all(color: AppTheme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: AppTheme.yellow, fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String k;
  final String v;
  const _InfoRow(this.k, this.v);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(width: 100, child: Text(k, style: const TextStyle(color: AppTheme.muted))),
          Expanded(child: Text(v, style: const TextStyle(color: AppTheme.text, fontWeight: FontWeight.w700))),
        ],
      ),
    );
  }
}

class _CounterBox extends StatelessWidget {
  final String label;
  final int target;
  const _CounterBox({required this.label, required this.target});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 132,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.bg.withOpacity(0.35),
        border: Border.all(color: AppTheme.border),
      ),
      child: Column(
        children: [
          AnimatedCounter(
            target: target,
            suffix: '+',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: AppTheme.cyan),
          ),
          const SizedBox(height: 4),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(color: AppTheme.text)),
        ],
      ),
    );
  }
}
