import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/app_drawer.dart';

class NavbarSection extends StatefulWidget {
  final GlobalKey navKey, heroKey, aboutKey, skillsKey, servicesKey, projectsKey, appsKey, contactKey;
  final Future<void> Function(GlobalKey key) onNavigate;

  const NavbarSection({
    super.key,
    required this.navKey,
    required this.heroKey,
    required this.aboutKey,
    required this.skillsKey,
    required this.servicesKey,
    required this.projectsKey,
    required this.appsKey,
    required this.contactKey,
    required this.onNavigate,
  });

  @override
  State<NavbarSection> createState() => _NavbarSectionState();
}

class _NavbarSectionState extends State<NavbarSection> {
  bool glow = false;

  @override
  Widget build(BuildContext context) {
    final items = [
      ('ပင်မ', widget.heroKey),
      ('အကြောင်း', widget.aboutKey),
      ('ကျွမ်းကျင်မှု', widget.skillsKey),
      ('ဝန်ဆောင်မှု', widget.servicesKey),
      ('ပရောဂျက်', widget.projectsKey),
      ('App များ', widget.appsKey),
      ('ဆက်သွယ်ရန်', widget.contactKey),
    ];

    return Container(
      key: widget.navKey,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: AppTheme.panel.withOpacity(0.75),
        border: Border.all(color: glow ? AppTheme.cyan : AppTheme.border),
        boxShadow: [
          BoxShadow(
            color: AppTheme.cyan.withOpacity(glow ? 0.22 : 0.08),
            blurRadius: glow ? 28 : 12,
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, c) {
          final mobile = c.maxWidth < 980;
          return Row(
            children: [
              MouseRegion(
                onEnter: (_) => setState(() => glow = true),
                onExit: (_) => setState(() => glow = false),
                child: const Text(
                  'MKA',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: AppTheme.cyan),
                ),
              ),
              const Spacer(),
              if (!mobile)
                Wrap(
                  spacing: 8,
                  children: items
                      .map(
                        (e) => TextButton(
                          onPressed: () => widget.onNavigate(e.$2),
                          child: Text(e.$1, style: const TextStyle(color: AppTheme.text)),
                        ),
                      )
                      .toList(),
                )
              else
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu_rounded),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
