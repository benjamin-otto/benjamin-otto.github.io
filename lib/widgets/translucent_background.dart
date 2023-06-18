import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/theme.dart';
import '../utils/extensions.dart';
import '../utils/side.dart';

class TranslucentBackground extends StatelessWidget {
  const TranslucentBackground({
    super.key,
    this.axis = Axis.horizontal,
    this.color = NeonColors.primary,
    this.bracketDepth = 16,
    required this.child,
  });

  final Axis axis;
  final Color color;
  final double bracketDepth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Container(color: color.withOpacity(0.1))),
        child,
        if (axis == Axis.horizontal) ...[
          _bracket(Side.left),
          _bracket(Side.right),
        ],
        if (axis == Axis.vertical) ...[
          _bracket(Side.top),
          _bracket(Side.bottom),
        ],
      ],
    );
  }

  Widget _bracket(Side side) {
    final topOrHorizontal = side.isTop || axis.isHorizontal;
    final bottomOrHorizontal = side.isBottom || axis.isHorizontal;
    final leftOrVertical = side.isLeft || axis.isVertical;
    final rightOrVertical = side.isRight || axis.isVertical;
    final borderSide = BorderSide(color: color, width: AppTheme.borderWidth);

    return Positioned(
      top: topOrHorizontal ? 0 : null,
      bottom: bottomOrHorizontal ? 0 : null,
      left: leftOrVertical ? 0 : null,
      right: rightOrVertical ? 0 : null,
      child: Container(
        width: axis.isHorizontal ? bracketDepth : null,
        height: axis.isVertical ? bracketDepth : null,
        decoration: BoxDecoration(
          border: Border(
            top: topOrHorizontal ? borderSide : BorderSide.none,
            bottom: bottomOrHorizontal ? borderSide : BorderSide.none,
            left: leftOrVertical ? borderSide : BorderSide.none,
            right: rightOrVertical ? borderSide : BorderSide.none,
          ),
        ),
      ),
    );
  }
}
