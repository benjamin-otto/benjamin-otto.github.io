import 'package:flutter/material.dart';

import '../../utils/helpers.dart';
import '../gradient_text.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.gradientColors,
    required this.texts,
    this.marginBottom = true,
  });

  final List<Color> gradientColors;
  final List<SectionTitleText> texts;
  final bool marginBottom;

  @override
  Widget build(BuildContext context) {
    var defaultStyle = Theme.of(context).textTheme.displayLarge;

    return Column(
      children: [
        FittedBox(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              for (int i = 0; i < texts.length; i++) ...[
                texts[i].includeGradient
                    ? GradientText(
                        text: texts[i].text,
                        colors: gradientColors,
                        style: texts[i].style ?? defaultStyle,
                      )
                    : Text(
                        texts[i].text,
                        style: texts[i].style ?? defaultStyle,
                      ),
              ]
            ],
          ),
        ),
        if (marginBottom)
          SizedBox(height: responsiveValue(context, mobile: 8, desktop: 16)),
      ],
    );
  }
}

class SectionTitleText {
  SectionTitleText({
    required this.text,
    this.includeGradient = false,
    this.style,
  });

  final String text;
  final bool includeGradient;
  final TextStyle? style;
}
