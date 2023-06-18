enum Side { top, bottom, left, right }

extension SideX on Side {
  bool get isTop => this == Side.top;
  bool get isBottom => this == Side.bottom;
  bool get isLeft => this == Side.left;
  bool get isRight => this == Side.right;
}
