import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/helpers.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      alignment: Alignment.center,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(FontAwesomeIcons.github),
                onPressed: openGitHub,
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.linkedin),
                onPressed: openLinkedIn,
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.envelope),
                onPressed: emailSelf,
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            '© Benjamin Otto 2023 | All rights reserved.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
