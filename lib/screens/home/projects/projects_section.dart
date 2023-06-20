import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../providers/app_theme_mode/app_theme_mode.dart';
import '../../../utils/extensions.dart';
import '../../../utils/helpers.dart';
import '../../../widgets/section/section_container.dart';
import '../../../widgets/section/section_description.dart';
import '../../../widgets/section/section_spacer.dart';
import '../../../widgets/section/section_title.dart';
import 'projects.dart';

class ProjectsSection extends ConsumerStatefulWidget {
  const ProjectsSection({super.key});

  @override
  ConsumerState<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends ConsumerState<ProjectsSection> {
  // Keeps [Project]s from reanimating after theme change
  final _projectsKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: _projectsKey,
      onVisibilityChanged: (info) => _updateTheme(context, info.percentVisible),
      child: SectionContainer(
        child: Column(
          children: [
            _title(context),
            _description,
            const SectionSpacer(),
            responsiveValue(context, mobile: _mobile, desktop: _desktop),
          ],
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    final ThemeData(:colorScheme) = Theme.of(context);
    return SectionTitle(
      gradientColors: [
        colorScheme.tertiary,
        colorScheme.primary,
        colorScheme.secondary,
      ],
      texts: [
        SectionTitleText(text: 'My'),
        SectionTitleText(text: ' flutterings.', includeGradient: true),
      ],
    );
  }

  Widget get _description => const SectionDescription(
        text: 'Apps and packages I\'ve developed both professionally '
            'and personally with Flutter.',
        textAlign: TextAlign.center,
      );

  Widget get _mobile => Column(
        children: [
          thaiWordOfTheDayApp,
          animatedFlightPathsPackage,
          multiBorderPackage,
          portfolioSite,
          comingSoon,
        ].withSpaceBetween(height: 40),
      );

  Widget get _desktop => Column(
        children: [
          _projectRow(thaiWordOfTheDayApp, animatedFlightPathsPackage),
          _projectRow(multiBorderPackage, portfolioSite),
          _projectRow(comingSoon, const SizedBox()),
        ].withSpaceBetween(height: 64),
      );

  // It's only a few rows, so [IntrinsicHeight] shouldn't be too costly here
  Widget _projectRow(Widget column1, Widget column2) => IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: column1),
            const SizedBox(width: 32),
            Expanded(child: column2),
          ],
        ),
      );

  void _updateTheme(BuildContext context, double percentVisible) {
    final modeProvider = ref.read(appThemeModeProvider.notifier);
    final mode = ref.read(appThemeModeProvider);
    const threshold = 10;

    if (mode.isDark && percentVisible > threshold) {
      modeProvider.setThemeMode(ThemeMode.light);
    } else if (mode.isLight && percentVisible < threshold) {
      modeProvider.setThemeMode(ThemeMode.dark);
    }
  }
}
