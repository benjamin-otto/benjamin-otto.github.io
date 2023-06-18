import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/helpers.dart';

class CallToAction extends StatelessWidget {
  const CallToAction({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:colorScheme, :textTheme) = Theme.of(context);
    final helloStyle = textTheme.titleMedium?.copyWith(
      fontSize: responsiveValue(context, mobile: 14, desktop: 16),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FittedBox(
          child: RichText(
            text: TextSpan(
              text: 'HELLO, MY NAME IS ',
              style: helloStyle?.copyWith(color: colorScheme.primary),
              children: [
                TextSpan(
                  text: 'BENJAMIN',
                  style: helloStyle?.copyWith(color: colorScheme.secondary),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: responsiveValue(context, mobile: 8, desktop: 2)),
        FittedBox(
          child: Text(
            'I make Flutter apps.',
            style: textTheme.displayLarge?.copyWith(fontSize: 72),
          ),
        ),
        const SizedBox(height: 16),
        _buttonRow(colorScheme),
      ],
    );
  }

  Widget _buttonRow(ColorScheme colorScheme) => const FittedBox(
        child: Row(
          children: [
            IconButton(
              icon: FaIcon(FontAwesomeIcons.github),
              onPressed: openGitHub,
            ),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.linkedin),
              onPressed: openLinkedIn,
            ),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.envelope),
              onPressed: emailSelf,
            ),
          ],
        ),
      );
}
