import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

extension PathX on Path {
  void quadraticBezierToFromOffsets(Offset controlPoint, Offset endPoint) =>
      quadraticBezierTo(
        controlPoint.dx,
        controlPoint.dy,
        endPoint.dx,
        endPoint.dy,
      );
}

extension ListWidgetX on List<Widget> {
  List<Widget> withSpaceBetween({double? width, double? height}) {
    return [
      for (int i = 0; i < length; i++) ...[
        if (i > 0) SizedBox(width: width, height: height),
        this[i],
      ],
    ];
  }
}

extension VisibilityInfoX on VisibilityInfo {
  double get percentVisible => visibleFraction * 100;
}

extension AxisX on Axis {
  bool get isHorizontal => this == Axis.horizontal;
  bool get isVertical => this == Axis.vertical;
}

extension ThemeModeX on ThemeMode {
  bool get isDark => this == ThemeMode.dark;
  bool get isLight => this == ThemeMode.light;
}
