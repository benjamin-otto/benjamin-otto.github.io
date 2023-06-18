import 'package:flutter/material.dart';

import '../../utils/helpers.dart';

class SectionSpacer extends StatelessWidget {
  const SectionSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: responsiveValue(
        context,
        mobile: 48,
        desktop: 64,
      ),
    );
  }
}
