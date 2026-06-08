import 'package:flutter/material.dart';

class AppTheme {
  static const bg = Color(0xFF050816);
  static const panel = Color(0xFF0A1022);
  static const panel2 = Color(0xFF111838);
  static const cyan = Color(0xFF00F5FF);
  static const pink = Color(0xFFFF3DBE);
  static const yellow = Color(0xFFFFE600);
  static const text = Color(0xFFEAF2FF);
  static const muted = Color(0xFF8A9ABB);
  static const border = Color(0xFF263355);

  static const heroGradient = LinearGradient(
    colors: [cyan, pink, yellow],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient cardGradient(int index) {
    final gradients = [
      [cyan, pink],
      [pink, yellow],
      [yellow, cyan],
    ];
    final c = gradients[index % gradients.length];
    return LinearGradient(colors: c, begin: Alignment.topLeft, end: Alignment.bottomRight);
  }
}
