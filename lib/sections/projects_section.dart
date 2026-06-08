import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../app_data.dart';
import '../widgets/neon_button.dart';
import '../widgets/section_shell.dart';
import '../widgets/neon_card.dart';
import '../widgets/cyber_clipper.dart';
import '../widgets/section_shell.dart' show SectionShell;
import '../widgets/cyber_background.dart';
import '../widgets/neon_button.dart';
import '../widgets/cyber_clipper.dart';
import '../widgets/neon_card.dart';
import '../widgets/section_shell.dart';

import '../widgets/neon_button.dart';
import '../widgets/neon_card.dart';
import '../widgets/section_shell.dart';
import '../widgets/cyber_clipper.dart';
import '../widgets/neon_button.dart';
import '../widgets/neon_card.dart';
import '../widgets/section_shell.dart';

import '../widgets/neon_button.dart';
import '../widgets/neon_card.dart';
import '../widgets/section_shell.dart';

import '../widgets/neon_button.dart';
import '../widgets/neon_card.dart';
import '../widgets/section_shell.dart';

import '../widgets/neon_button.dart';
import '../widgets/neon_card.dart';
import '../widgets/section_shell.dart';

import '../widgets/neon_button.dart';
import '../widgets/neon_card.dart';
import '../widgets/section_shell.dart';

import '../widgets/neon_button.dart';
import '../widgets/neon_card.dart';
import '../widgets/section_shell.dart';

import '../widgets/neon_button.dart';
import '../widgets/neon_card.dart';
import '../widgets/section_shell.dart';

import '../widgets/neon_button.dart';
import '../widgets/neon_card.dart';
import '../widgets/section_shell.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      label: 'Projects',
      title: 'Selected Work',
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: AppData.projects
              .asMap()
              .entries
              .map(
                (e) => SizedBox(
                  width: 374,
                  child: _ProjectCard(
                    index: e.key,
                    repo: e.value['repo']!,
                    title: e.value['title']!,
                    tag: e.value['tag']!,
                    desc: e.value['desc']!,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final int index;
  final String repo;
  final String title;
  final String tag;
  final String desc;
  const _ProjectCard({
    required this.index,
    required this.repo,
    required this.title,
    required this.tag,
    required this.desc,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: NeonCard(
        index: widget.index,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.tag, style: const TextStyle(color: AppTheme.yellow, fontWeight: FontWeight.w800)),
              const SizedBox(height: 10),
              Text(widget.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
              const SizedBox(height: 8),
              Text(widget.desc, style: const TextStyle(color: AppTheme.text, height: 1.6)),
              const SizedBox(height: 14),
              Text('Repo: ${widget.repo}', style: const TextStyle(color: AppTheme.muted)),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                children: [
                  NeonButton(
                    text: 'Demo',
                    icon: Icons.open_in_new_rounded,
                    onTap: () => openUrl('https://github.com/moekyawaung-tech/${widget.repo}'),
                  ),
                  NeonButton(
                    text: 'Source',
                    icon: Icons.code_rounded,
                    onTap: () => openUrl('https://github.com/moekyawaung-tech/${widget.repo}'),
                    filled: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
