import 'package:flutter/material.dart';

class AppColors {
  static const bg = Color(0xFF050816);
  static const panel = Color(0xFF0B1022);
  static const panel2 = Color(0xFF101736);
  static const cyan = Color(0xFF00F5FF);
  static const pink = Color(0xFFFF3DBE);
  static const yellow = Color(0xFFFFE600);
  static const text = Color(0xFFEAF2FF);
  static const muted = Color(0xFF93A4C3);
  static const border = Color(0xFF24304F);
}

const gradientNeon = LinearGradient(
  colors: [AppColors.cyan, AppColors.pink, AppColors.yellow],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

LinearGradient cardGradient(int index) {
  final list = [
    [AppColors.cyan, AppColors.pink],
    [AppColors.pink, AppColors.yellow],
    [AppColors.yellow, AppColors.cyan],
  ];
  final c = list[index % list.length];
  return LinearGradient(colors: c, begin: Alignment.topLeft, end: Alignment.bottomRight);
}
