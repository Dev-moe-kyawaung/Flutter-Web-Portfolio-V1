import 'package:flutter/material.dart';

class AnimatedCounter extends StatelessWidget {
  final int target;
  final String suffix;
  final Duration duration;
  final TextStyle? style;
  const AnimatedCounter({
    super.key,
    required this.target,
    this.suffix = '',
    this.duration = const Duration(milliseconds: 1300),
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: target),
      duration: duration,
      builder: (_, value, __) {
        return Text(
          '$value$suffix',
          style: style,
        );
      },
    );
  }
}
