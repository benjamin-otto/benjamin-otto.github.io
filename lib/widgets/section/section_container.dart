import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../../utils/helpers.dart';

class SectionContainer extends StatelessWidget {
  const SectionContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(
        minHeight: responsiveValue(
          context,
          desktop: MediaQuery.sizeOf(context).height,
          extraLarge: 1000,
        ),
      ),
      padding: responsiveValue(
        context,
        mobile: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        tablet: const EdgeInsets.symmetric(horizontal: 48, vertical: 96),
        desktop: const EdgeInsets.symmetric(horizontal: 64, vertical: 128),
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: AppTheme.contentMaxWidth),
        child: child,
      ),
    );
  }
}
