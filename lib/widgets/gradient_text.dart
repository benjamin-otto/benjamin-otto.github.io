import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText({
    super.key,
    required this.text,
    required this.colors,
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    this.style,
  });

  final String text;
  final List<Color> colors;
  final Alignment begin;
  final Alignment end;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (rect) => LinearGradient(
        colors: colors,
        begin: begin,
        end: end,
      ).createShader(rect),
      child: Text(text, style: style),
    );
  }
}
