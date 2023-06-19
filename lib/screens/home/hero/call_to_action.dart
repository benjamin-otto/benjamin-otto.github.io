import 'package:flutter/material.dart';

import '../../../utils/helpers.dart';
import '../../../widgets/accounts_row.dart';

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
      crossAxisAlignment: responsiveValue(
        context,
        mobile: CrossAxisAlignment.center,
        desktop: CrossAxisAlignment.start,
      ),
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
        const SizedBox(height: 8),
        FittedBox(
          child: Text(
            'I make Flutter apps.',
            style: textTheme.displayLarge?.copyWith(fontSize: 72),
          ),
        ),
        const SizedBox(height: 8),
        const AccountsRow(),
      ],
    );
  }
}
