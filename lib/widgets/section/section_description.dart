import 'package:flutter/material.dart';

class SectionDescription extends StatelessWidget {
  const SectionDescription({
    super.key,
    required this.text,
    this.color,
    this.textAlign,
  });

  final String text;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final ThemeData(:colorScheme, :textTheme) = Theme.of(context);
    return Text(
      text,
      style: textTheme.titleMedium?.copyWith(
        color: color ?? colorScheme.onSurface,
      ),
      textAlign: textAlign,
    );
  }
}
