import 'package:flutter/material.dart';

class RevealOnScroll extends StatefulWidget {
  final Widget child;
  const RevealOnScroll({super.key, required this.child});

  @override
  State<RevealOnScroll> createState() => _RevealOnScrollState();
}

class _RevealOnScrollState extends State<RevealOnScroll> with SingleTickerProviderStateMixin {
  bool visible = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => visible = true);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOutCubic,
      offset: visible ? Offset.zero : const Offset(0, 0.08),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 700),
        opacity: visible ? 1 : 0,
        child: widget.child,
      ),
    );
  }
}
