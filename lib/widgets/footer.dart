import 'package:flutter/material.dart';

import 'accounts_row.dart';

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
          AccountsRow(),
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
