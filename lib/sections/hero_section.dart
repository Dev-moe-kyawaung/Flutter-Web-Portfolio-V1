import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../app_data.dart';
import '../widgets/animated_typing_text.dart';
import '../widgets/neon_button.dart';
import '../widgets/section_shell.dart';
import '../widgets/cyber_clipper.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      label: AppData.title,
      title: '${AppData.nameMm}
${AppData.nameEn}',
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: LayoutBuilder(
          builder: (context, c) {
            final mobile = c.maxWidth < 920;
            return Wrap(
              spacing: 24,
              runSpacing: 24,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SizedBox(
                  width: mobile ? c.maxWidth : c.maxWidth * 0.54,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppData.location, style: const TextStyle(color: AppTheme.muted, fontSize: 16)),
                      const SizedBox(height: 14),
                      const AnimatedTypingText(texts: AppData.roles),
                      const SizedBox(height: 18),
                      Text(
                        'I build polished mobile and web experiences with premium motion, clean architecture, and a futuristic visual identity.',
                        style: const TextStyle(color: AppTheme.text, height: 1.7, fontSize: 16),
                      ),
                      const SizedBox(height: 22),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          NeonButton(text: 'View Projects', icon: Icons.apps_rounded, onTap: () {}),
                          NeonButton(text: 'Contact Me', icon: Icons.mail_rounded, onTap: () {}, filled: false),
                        ],
                      ),
                      const SizedBox(height: 22),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: AppData.stats
                            .map(
                              (s) => _HeroStatBox(value: s['value']!, label: s['label']!),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
                const _HeroAvatar(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _HeroStatBox extends StatelessWidget {
  final String value;
  final String label;
  const _HeroStatBox({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppTheme.panel2,
        border: Border.all(color: AppTheme.border),
      ),
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (r) => AppTheme.heroGradient.createShader(r),
            child: Text(
              value,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Colors.white),
            ),
          ),
          Text(label, style: const TextStyle(color: AppTheme.text)),
        ],
      ),
    );
  }
}

class _HeroAvatar extends StatefulWidget {
  const _HeroAvatar();

  @override
  State<_HeroAvatar> createState() => _HeroAvatarState();
}

class _HeroAvatarState extends State<_HeroAvatar> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 8))..repeat();
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
        return Container(
          width: 310,
          height: 310,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: SweepGradient(
              colors: const [AppTheme.cyan, AppTheme.pink, AppTheme.yellow, AppTheme.cyan],
              transform: GradientRotation(controller.value * 6.28318),
            ),
            boxShadow: [
              BoxShadow(color: AppTheme.cyan.withOpacity(0.24), blurRadius: 26),
            ],
          ),
          child: ClipOval(
            child: Image.network(
              AppData.avatarUrl,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
