import 'package:flutter/material.dart';

import '../../../widgets/responsive_layout.dart';
import '../../../widgets/section/section_container.dart';
import 'call_to_action.dart';
import 'solar_system.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: ResponsiveLayout(
        mobile: _mobile,
        tablet: _tablet,
        desktop: _desktop,
      ),
    );
  }

  Widget get _mobile => ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SolarSystem(),
            SizedBox(height: 48),
            CallToAction(),
          ],
        ),
      );

  Widget get _tablet => ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SolarSystem(),
            SizedBox(height: 64),
            CallToAction(),
          ],
        ),
      );

  Widget get _desktop => const Row(
        children: [
          Expanded(flex: 5, child: SolarSystem()),
          SizedBox(width: 64),
          Expanded(flex: 6, child: CallToAction()),
        ],
      );
}
