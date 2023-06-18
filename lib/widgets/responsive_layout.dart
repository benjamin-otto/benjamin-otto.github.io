import 'package:flutter/material.dart';

import '../constants/breakpoints.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    this.mobile,
    this.tablet,
    this.desktop,
    this.extraLarge,
  }) : assert(mobile != null || desktop != null);

  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? extraLarge;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width > Breakpoints.xl && extraLarge != null) return extraLarge!;
    if (width > Breakpoints.lg && desktop != null) return desktop!;
    if (width > Breakpoints.md && tablet != null) return tablet!;

    return mobile ?? desktop!;
  }
}
