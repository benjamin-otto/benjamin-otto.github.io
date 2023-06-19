import 'dart:math' as math;
import 'package:flutter/material.dart' show BuildContext, MediaQuery;
import 'package:url_launcher/url_launcher.dart';

import '../constants/breakpoints.dart';

T responsiveValue<T>(
  BuildContext context, {
  T? mobile,
  T? tablet,
  T? desktop,
  T? extraLarge,
}) {
  assert(mobile != null || desktop != null);
  final width = MediaQuery.sizeOf(context).width;

  if (width > Breakpoints.xl && extraLarge != null) return extraLarge;
  if (width > Breakpoints.lg && desktop != null) return desktop;
  if (width > Breakpoints.md && tablet != null) return tablet;

  return mobile ?? desktop!;
}

int randomIntInRange({required int min, required int max}) {
  return min + math.Random().nextInt(max - min + 1);
}

double randomDoubleInRange({required double min, required double max}) {
  return min + math.Random().nextDouble() * (max - min);
}

Future<void> openUrl(String url) async =>
    await launchUrl(Uri.parse(url), webOnlyWindowName: '_blank');
