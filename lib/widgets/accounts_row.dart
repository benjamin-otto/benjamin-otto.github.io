import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/image_paths.dart';
import '../utils/helpers.dart';

class AccountsRow extends StatelessWidget {
  const AccountsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.github),
          onPressed: () => openUrl('https://github.com/benjamin-otto'),
        ),
        IconButton(
          icon: Image.asset(
            Logos.leetcode,
            width: 24,
            height: 24,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          onPressed: () => openUrl('https://leetcode.com/benottoman/'),
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.linkedin),
          onPressed: () => openUrl('https://www.linkedin.com/in/ottobenjamin/'),
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.envelope),
          onPressed: () => openUrl(
            'mailto:benjaminotto@pm.me'
            '?subject=Let\'s Talk!'
            '&body=Hello Benjamin,\n\n'
            'I\'m interested in working on a Flutter project together.',
            false,
          ),
        ),
      ],
    );
  }
}
