import 'package:flutter/material.dart';
import 'theme.dart';
import 'widgets.dart';

class HomeNavbar extends StatelessWidget {
  final GlobalKey navKey, heroKey, aboutKey, skillsKey, servicesKey, projectsKey, appsKey, contactKey;
  final void Function(GlobalKey key) onTap;
  const HomeNavbar({
    super.key,
    required this.navKey,
    required this.onTap,
    required this.heroKey,
    required this.aboutKey,
    required this.skillsKey,
    required this.servicesKey,
    required this.projectsKey,
    required this.appsKey,
    required this.contactKey,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      ('ပင်မ', heroKey),
      ('အကြောင်း', aboutKey),
      ('ကျွမ်းကျင်မှု', skillsKey),
      ('ဝန်ဆောင်မှု', servicesKey),
      ('ပရောဂျက်', projectsKey),
      ('App များ', appsKey),
      ('ဆက်သွယ်ရန်', contactKey),
    ];

    return Container(
      key: navKey,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.panel.withOpacity(0.7),
        border: Border.all(color: AppColors.cyan.withOpacity(0.25)),
        boxShadow: [BoxShadow(color: AppColors.cyan.withOpacity(0.15), blurRadius: 22)],
      ),
      child: LayoutBuilder(
        builder: (context, c) {
          final mobile = c.maxWidth < 900;
          return Row(
            children: [
              const Text('MKA', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: AppColors.cyan)),
              const Spacer(),
              if (!mobile)
                Wrap(
                  spacing: 16,
                  children: items
                      .map((e) => TextButton(
                            onPressed: () => onTap(e.$2),
                            child: Text(e.$1, style: const TextStyle(color: AppColors.text)),
                          ))
                      .toList(),
                )
              else
                PopupMenuButton<String>(
                  icon: const Icon(Icons.menu_rounded, color: AppColors.text),
                  onSelected: (v) => onTap(items.firstWhere((e) => e.$1 == v).$2),
                  itemBuilder: (_) => items
                      .map((e) => PopupMenuItem(value: e.$1, child: Text(e.$1)))
                      .toList(),
                ),
            ],
          );
        },
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      label: 'Senior Android Developer',
      title: 'မိုးကျော်အောင်
Moe Kyaw Aung',
      child: LayoutBuilder(
        builder: (context, c) {
          final mobile = c.maxWidth < 900;
          return Wrap(
            runSpacing: 24,
            spacing: 24,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SizedBox(
                width: mobile ? c.maxWidth : c.maxWidth * 0.55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Tachileik, Myanmar 🇲🇲 ↔ Bangkok, Thailand 🇹🇭', style: TextStyle(color: AppColors.muted, fontSize: 16)),
                    SizedBox(height: 14),
                    TypingText(
                      roles: [
                        'Android / Flutter Developer',
                        'Kotlin · Jetpack Compose Expert',
                        'Cybersecurity Enthusiast',
                        'AI / ML Builder',
                      ],
                    ),
                    SizedBox(height: 18),
                    Text(
                      'I build premium mobile and web experiences with a cyber-modern look, strong architecture, and production-ready attention to detail.',
                      style: TextStyle(color: AppColors.text, height: 1.6, fontSize: 16),
                    ),
                    SizedBox(height: 22),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        _HeroStat('82+', 'Certs'),
                        _HeroStat('40+', 'Skills'),
                        _HeroStat('16', 'Apps'),
                      ],
                    ),
                  ],
                ),
              ),
              const AvatarRing(),
            ],
          );
        },
      ),
    );
  }
}

class _HeroStat extends StatelessWidget {
  final String n;
  final String l;
  const _HeroStat(this.n, this.l);

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        child: Column(children: [
          Text(n, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: AppColors.yellow)),
          Text(l, style: const TextStyle(color: AppColors.text)),
        ]),
      ),
    );
  }
}

class AvatarRing extends StatefulWidget {
  const AvatarRing({super.key});

  @override
  State<AvatarRing> createState() => _AvatarRingState();
}

class _AvatarRingState extends State<AvatarRing> with SingleTickerProviderStateMixin {
  late AnimationController c;
  @override
  void initState() {
    super.initState();
    c = AnimationController(vsync: this, duration: const Duration(seconds: 8))..repeat();
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
        return Container(
          width: 290,
          height: 290,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: SweepGradient(
              colors: [AppColors.cyan, AppColors.pink, AppColors.yellow, AppColors.cyan],
              transform: GradientRotation(c.value * 6.28),
            ),
            boxShadow: [BoxShadow(color: AppColors.cyan.withOpacity(0.3), blurRadius: 30)],
          ),
          padding: const EdgeInsets.all(7),
          child: ClipOval(
            child: Container(
              color: AppColors.panel2,
              child: Image.network(
                'https://res.cloudinary.com/dye5qpwii/image/upload/v1778527878/IMG_20260430_053105_uef0yr.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      label: 'About',
      title: 'Developer by passion,
learner by nature.',
      child: LayoutBuilder(
        builder: (context, c) {
          final mobile = c.maxWidth < 900;
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
                      'I create polished apps and portfolio experiences with clean architecture, premium visual hierarchy, and smooth motion.',
                      style: TextStyle(color: AppColors.text, fontSize: 16, height: 1.8),
                    ),
                    SizedBox(height: 14),
                    Text(
                      'Focus areas include Android, Flutter, backend APIs, cybersecurity, and AI/ML integrations.',
                      style: TextStyle(color: AppColors.text, fontSize: 16, height: 1.8),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: mobile ? c.maxWidth : c.maxWidth * 0.35,
                child: const GlassPanel(
                  child: Padding(
                    padding: EdgeInsets.all(18),
                    child: Column(
                      children: [
                        _InfoRow('Name', 'Moe Kyaw Aung'),
                        _InfoRow('GitHub', 'Dev-moe-kyawaung'),
                        _InfoRow('Role', 'Senior Android Developer'),
                        _InfoRow('Status', 'Open to work'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String k, v;
  const _InfoRow(this.k, this.v);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(width: 120, child: Text(k, style: const TextStyle(color: AppColors.muted))),
          Expanded(child: Text(v, style: const TextStyle(color: AppColors.text, fontWeight: FontWeight.w700))),
        ],
      ),
    );
  }
}

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
      child: Column(
        children: skills
            .map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _SkillBar(name: e.$1, value: e.$2),
                ))
            .toList(),
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
    return GlassPanel(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(name, style: const TextStyle(color: AppColors.text, fontWeight: FontWeight.w700)),
              Text('${(value * 100).round()}%', style: const TextStyle(color: AppColors.yellow)),
            ]),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: value),
                duration: const Duration(milliseconds: 1200),
                builder: (_, v, __) => LinearProgressIndicator(
                  value: v,
                  minHeight: 10,
                  backgroundColor: Colors.white12,
                  valueColor: const AlwaysStoppedAnimation(AppColors.cyan),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      'Android App Development',
      'Flutter Web Portfolios',
      'UI / UX Prototyping',
      'Firebase Integration',
      'API Integration',
      'Security / AI Add-ons',
    ];
    return SectionShell(
      label: 'Services',
      title: 'Premium Development Services',
      child: Wrap(
        spacing: 18,
        runSpacing: 18,
        children: items.map((e) => SizedBox(width: 360, child: _ServiceCard(title: e))).toList(),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String title;
  const _ServiceCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(18),
        child: Stack(
          children: [
            Positioned.fill(
              child: AnimatedOpacity(
                opacity: 0.08,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  decoration: BoxDecoration(gradient: gradientNeon),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      ('video-player', 'Flutter video player', 'Flutter'),
      ('social-dashboard', 'Social dashboard', 'Admin'),
      ('game-collection', 'Game collection', 'Games'),
      ('pwa-app', 'PWA app', 'PWA'),
      ('Job-Portal-App', 'Job portal', 'Jobs'),
      ('POS-Ultimate-Pro-Max', 'POS premium', 'Business'),
    ];
    return SectionShell(
      label: 'Projects',
      title: 'Selected Work',
      child: Wrap(
        spacing: 18,
        runSpacing: 18,
        children: projects.map((p) => SizedBox(width: 370, child: _ProjectCard(repo: p.$1, title: p.$2, tag: p.$3))).toList(),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String repo, title, tag;
  const _ProjectCard({required this.repo, required this.title, required this.tag});

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tag, style: const TextStyle(color: AppColors.yellow, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            Text('GitHub repo: $repo', style: const TextStyle(color: AppColors.muted)),
            const SizedBox(height: 16),
            Wrap(spacing: 12, children: [
              ElevatedButton(onPressed: () => openUrl('https://github.com/moekyawaung-tech/$repo'), child: const Text('Demo')),
              OutlinedButton(onPressed: () => openUrl('https://github.com/moekyawaung-tech/$repo'), child: const Text('Source')),
            ]),
          ],
        ),
      ),
    );
  }
}

class AppsSection extends StatelessWidget {
  const AppsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final apps = [
      'Social Dashboard',
      'PWA App',
      'Admin Dashboard',
      'Stock Market',
      'Game Collection',
      'Music Player',
      'Chat App',
      'World Cup',
      'E-commerce',
      'Portfolio',
      'Money Tracker',
      'Weather',
      'Crypto',
      'Todo',
      'Video Player',
      'LEGEND!',
    ];
    return SectionShell(
      label: 'App Collection',
      title: 'Built Apps',
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: apps.map((a) => Chip(
          label: Text(a),
          backgroundColor: AppColors.panel2,
          side: const BorderSide(color: AppColors.border),
        )).toList(),
      ),
    );
  }
}

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      label: 'Contact',
      title: 'Let’s build something premium',
      child: GlassPanel(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: name,
                  decoration: const InputDecoration(labelText: 'အမည်'),
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'အမည်ထည့်ပါ' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: email,
                  decoration: const InputDecoration(labelText: 'အီးမေးလ်'),
                  validator: (v) => (v == null || !v.contains('@')) ? 'အီးမေးလ်မှန်ကန်စွာထည့်ပါ' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: message,
                  maxLines: 5,
                  decoration: const InputDecoration(labelText: 'မက်ဆေ့ချ်'),
                  validator: (v) => (v == null || v.trim().length < 10) ? 'မက်ဆေ့ချ်အနည်းဆုံး စာလုံး 10 လုံးထည့်ပါ' : null,
                ),
                const SizedBox(height: 16),
                NeonButton(
                  text: 'Send Message',
                  icon: Icons.send_rounded,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('အောင်မြင်စွာပို့ပြီးပါပြီ')),
                      );
                    }
                  },
                ),
                const SizedBox(height: 18),
                Wrap(
                  spacing: 12,
                  children: [
                    TextButton(onPressed: () => openUrl('https://github.com/Dev-moe-kyawaung/'), child: const Text('GitHub')),
                    TextButton(onPressed: () => openUrl('https://gravatar.com/moekyawaung2026'), child: const Text('Gravatar')),
                    TextButton(onPressed: () => openUrl('https://www.linkedin.com/in/moe-kyaw-aung-2653093a1'), child: const Text('LinkedIn')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
