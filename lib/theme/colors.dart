import 'package:flutter/material.dart';

final baseColors = const ColorScheme.light().copyWith(
  primary: const Color(0xFF45D1FD),
  secondary: const Color(0xFFF6C427),
  tertiary: const Color(0xFF05589c),
  error: const Color(0xFFFF3C38),
);

final darkColors = baseColors.copyWith(
  background: const Color(0xFF121619),
  onBackground: const Color(0xFFD6F5FF),
  onSurface: const Color(0xFFA0A2A3),
);

final lightColors = baseColors.copyWith(
  background: const Color(0xFFD6F5FF),
  onBackground: const Color(0xFF044376),
  onSurface: const Color(0xFF044376),
);

abstract class NeonColors {
  static const primary = Color(0xFF8091FB);
  // static const primary = Color(0xFFA682FF);
  static const secondary = Color(0xFFE13FFF);
  static const tertiary = Color(0xFFF7C42A);
  static const quaternary = Color(0xFF45D1FD);
}
