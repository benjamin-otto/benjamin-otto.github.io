import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../constants/image_paths.dart';
import '../utils/side.dart';
import '../utils/helpers.dart';

class WhackAMole extends StatefulWidget {
  const WhackAMole({super.key});

  @override
  State<WhackAMole> createState() => _WhackAMoleState();
}

class _WhackAMoleState extends State<WhackAMole>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Timer _timer;
  String _peekImage = Me.peekSus;
  Offset _begin = Offset.zero;
  double _angle = 0;
  double? _top, _bottom, _left, _right;
  Side? _lastSide;

  final _images = [
    Me.peekBird,
    Me.peekBrowRaised,
    Me.peekBugEyed,
    Me.peekEyeRoll,
    Me.peekSus,
    Me.peekSerious,
    Me.peekSmile,
    Me.peekSmirk,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => _scheduleTimer());
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _top,
      bottom: _bottom,
      left: _left,
      right: _right,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, child) => FractionalTranslation(
          translation: Tween<Offset>(
            begin: _begin,
            end: Offset.zero,
          ).animate(_controller).value,
          child: MouseRegion(
            onEnter: (_) => _hideMe(200),
            child: GestureDetector(
              onTap: () => _hideMe(200),
              child: Transform.rotate(
                angle: _angle,
                child: Image.asset(
                  _peekImage,
                  height: responsiveValue(context, mobile: 64, desktop: 128),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _scheduleTimer() {
    _randomizeAnimationValues();
    _timer = Timer(_randomDuration, _showMe);
  }

  void _showMe() {
    _controller
        .forward()
        .whenComplete(() => _hideMe(_controller.duration!.inMilliseconds));
  }

  void _hideMe(int milliseconds) {
    _controller
      ..reverseDuration = Duration(milliseconds: milliseconds)
      ..reverse().whenComplete(_scheduleTimer);
  }

  void _randomizeAnimationValues() {
    var Size(:width, :height) = MediaQuery.sizeOf(context);

    _resetPosition();
    _peekImage = _randomImage();

    switch (_randomSide) {
      case Side.top:
        _top = 0;
        _left = _randomPosition(width);
        _angle = math.pi;
        _begin = const Offset(0, -1);
        break;
      case Side.bottom:
        _bottom = 0;
        _left = _randomPosition(width);
        _angle = 0;
        _begin = const Offset(0, 1);
        break;
      case Side.left:
        _left = 0;
        _top = _randomPosition(height);
        _angle = math.pi / 2;
        _begin = const Offset(-1, 0);
        break;
      case Side.right:
        _right = 0;
        _top = _randomPosition(height);
        _angle = (3 * math.pi) / 2;
        _begin = const Offset(1, 0);
        break;
    }
    setState(() {});
  }

  void _resetPosition() => _top = _bottom = _left = _right = null;

  String _randomImage() {
    int index = randomIntInRange(min: 0, max: _images.length - 1);
    return _images[index];
  }

  double _randomPosition(double dimension) => randomDoubleInRange(
        min: dimension * 0.25,
        max: dimension * 0.75,
      );

  Duration get _randomDuration {
    int seconds = randomIntInRange(min: 45, max: 90);
    return Duration(seconds: seconds);
  }

  Side get _randomSide {
    Side? randomSide;

    do {
      int index = randomIntInRange(min: 0, max: 3);
      randomSide = Side.values[index];
    } while (randomSide == _lastSide);

    setState(() => _lastSide = randomSide);
    return randomSide;
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }
}
