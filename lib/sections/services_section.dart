import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../app_data.dart';
import '../widgets/section_shell.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      label: 'Services',
      title: 'Premium Development Services',
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: AppData.services
              .asMap()
              .entries
              .map(
                (e) => _ServiceCard(
                  title: e.value,
                  index: e.key,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final String title;
  final int index;
  const _ServiceCard({required this.title, required this.index});

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        width: 360,
        height: 170,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppTheme.panel2,
          border: Border.all(color: hover ? AppTheme.cyan : AppTheme.border),
          boxShadow: [
            BoxShadow(
              color: hover ? AppTheme.cyan.withOpacity(0.18) : Colors.transparent,
              blurRadius: hover ? 22 : 0,
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -12,
              top: 12,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 220),
                opacity: hover ? 1 : 0.15,
                child: Container(
                  width: 180,
                  height: 26,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, AppTheme.cyan.withOpacity(0.5), Colors.transparent],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                widget.title,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: AppTheme.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
