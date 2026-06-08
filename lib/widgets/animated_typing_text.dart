import 'dart:async';
import 'package:flutter/material.dart';
import '../app_theme.dart';

class AnimatedTypingText extends StatefulWidget {
  final List<String> texts;
  const AnimatedTypingText({super.key, required this.texts});

  @override
  State<AnimatedTypingText> createState() => _AnimatedTypingTextState();
}

class _AnimatedTypingTextState extends State<AnimatedTypingText> {
  int index = 0;
  int chars = 0;
  bool deleting = false;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 70), (_) {
      final current = widget.texts[index];
      setState(() {
        if (!deleting) {
          chars++;
          if (chars >= current.length) {
            deleting = true;
          }
        } else {
          chars--;
          if (chars <= 0) {
            deleting = false;
            index = (index + 1) % widget.texts.length;
          }
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = widget.texts[index].substring(0, chars.clamp(0, widget.texts[index].length));
    return Text(
      '$text|',
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w800,
        color: AppTheme.yellow,
      ),
    );
  }
}
