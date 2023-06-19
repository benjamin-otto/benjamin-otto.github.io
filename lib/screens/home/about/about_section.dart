import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/colors.dart';
import '../../../widgets/responsive_layout.dart';
import '../../../widgets/section/section_container.dart';
import '../../../widgets/section/section_title.dart';
import 'animated_flight_map.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: ResponsiveLayout(
        mobile: _mobile(context),
        desktop: _desktop(context),
      ),
    );
  }

  Widget _mobile(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _title,
          const SizedBox(height: 16),
          _chips,
          const SizedBox(height: 32),
          const AnimatedFlightMap(),
          const SizedBox(height: 32),
          _description(context),
        ],
      );

  Widget _desktop(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title,
                _description(context),
                const SizedBox(height: 20),
                _chips,
              ],
            ),
          ),
          const SizedBox(width: 40),
          const Expanded(child: AnimatedFlightMap()),
        ],
      );

  Widget get _title => SectionTitle(
        marginBottom: false,
        gradientColors: const [NeonColors.secondary, NeonColors.tertiary],
        texts: [
          SectionTitleText(text: 'It\'s me,', includeGradient: false),
          SectionTitleText(
            text: ' Benjamin.',
            includeGradient: true,
            style: GoogleFonts.dancingScript(
              fontSize: 60,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );

  Widget _description(BuildContext context) {
    final style = Theme.of(context)
        .textTheme
        .titleMedium
        ?.copyWith(color: Theme.of(context).colorScheme.onSurface);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Originally from Kansas City I love the midwest and all things BBQ. ',
          style: style,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 8),
        Text(
          'My second home is Chiang Mai, Thailand where I\'ve previously lived '
          'for more than a decade. While there I worked for two of the '
          'largest software companies in town, Manao Software and Aware Co. Ltd. '
          'Working with them I grew into a better developer.',
          style: style,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 8),
        Text(
          'I\'ve also been fortunate to have lived in both Denmark and Italy. '
          'Living abroad has taught me to be a more open-minded and accepting person. '
          'The world is your oyster.',
          style: style,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }

  Widget get _chips => const Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          _AttributeChip(label: 'developer'),
          _AttributeChip(label: 'traveler'),
          _AttributeChip(label: 'motorcyclist'),
          _AttributeChip(label: 'reader'),
          _AttributeChip(label: 'yoga practitioner'),
          _AttributeChip(label: 'weightlifter'),
          _AttributeChip(label: 'thai language enthusiast'),
          _AttributeChip(label: 'golfer'),
          _AttributeChip(label: 'life-long learner'),
        ],
      );
}

class _AttributeChip extends StatelessWidget {
  const _AttributeChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: 16,
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      shape: const LinearBorder(),
      label: Text(label),
    );
  }
}
