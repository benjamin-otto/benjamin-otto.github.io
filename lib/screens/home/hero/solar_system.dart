import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vector_math/vector_math_64.dart' as vector_math;

import '../../../../constants/image_paths.dart';
import '../../../utils/helpers.dart';

enum CelestialBody { sun, flutter, firebase, dart }

enum Orbit { inner, middle, outer }

class SolarSystem extends StatefulHookWidget {
  const SolarSystem({super.key});

  @override
  State<SolarSystem> createState() => _SolarSystemState();
}

class _SolarSystemState extends State<SolarSystem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final scale = useState<double>(0);
    final flutterController = useAnimationController(
      duration: const Duration(seconds: 64),
    )..repeat();
    final firebaseController = useAnimationController(
      duration: const Duration(seconds: 80),
    )..repeat();
    final dartController = useAnimationController(
      duration: const Duration(seconds: 96),
    )..repeat();

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) => scale.value = 1);
      return null;
    }, []);

    return AnimatedScale(
      scale: scale.value,
      duration: const Duration(seconds: 2),
      curve: Curves.easeOutQuint,
      child: LayoutBuilder(
        builder: (_, constraints) {
          return SizedBox.square(
            dimension: constraints.maxWidth < constraints.maxHeight
                ? constraints.maxWidth
                : constraints.maxHeight,
            child: CustomMultiChildLayout(
              delegate: _SolarSystemLayoutDelegate(
                planetAnimations: {
                  CelestialBody.flutter: flutterController,
                  CelestialBody.firebase: firebaseController,
                  CelestialBody.dart: dartController,
                },
              ),
              children: [
                const _OrbitPath(Orbit.outer),
                const _OrbitPath(Orbit.middle),
                const _OrbitPath(Orbit.inner),
                _flutterPlanet,
                _firebasePlanet,
                _dartPlanet,
                _sun,
              ],
            ),
          );
        },
      ),
    );
  }

  Widget get _sun => LayoutId(
        id: CelestialBody.sun,
        child: _CircleBorder(child: Image.asset(Me.main)),
      );

  Widget get _flutterPlanet => _Planet(
        celestialBody: CelestialBody.flutter,
        child: Padding(
          padding: responsiveValue(
            context,
            mobile: const EdgeInsets.only(right: 2, top: 1, bottom: 1),
            desktop: const EdgeInsets.only(right: 5, top: 2, bottom: 2),
          ),
          child: Image.asset(Logos.flutter),
        ),
      );

  Widget get _dartPlanet => _Planet(
        celestialBody: CelestialBody.dart,
        child: Padding(
          padding: responsiveValue(
            context,
            mobile: const EdgeInsets.all(0),
            desktop: const EdgeInsets.all(2),
          ),
          child: Image.asset(Logos.dart),
        ),
      );

  Widget get _firebasePlanet => _Planet(
        celestialBody: CelestialBody.firebase,
        child: Padding(
          padding: responsiveValue(
            context,
            mobile: const EdgeInsets.all(0),
            desktop: const EdgeInsets.all(2),
          ),
          child: Image.asset(Logos.firebase),
        ),
      );

  @override
  bool get wantKeepAlive => true;
}

class _SolarSystemLayoutDelegate extends MultiChildLayoutDelegate {
  _SolarSystemLayoutDelegate({required this.planetAnimations})
      : assert(planetAnimations.length == 3),
        super(relayout: planetAnimations.values.first);

  final Map<CelestialBody, Animation<double>> planetAnimations;

  @override
  void performLayout(Size size) {
    // Layout Sun
    Size sunSize = Size.zero;
    double sunRadius = 0;
    if (hasChild(CelestialBody.sun)) {
      sunSize = layoutChild(
        CelestialBody.sun,
        BoxConstraints.tight(Size.square(size.width / 2)),
      );
      positionChild(CelestialBody.sun, _centeredOffset(size, sunSize));
      sunRadius = sunSize.width / 2;
    }

    // Layout Orbit Paths
    final double orbitIncrement = size.width / 6;
    final orbitOffset = Offset(orbitIncrement, orbitIncrement);
    for (int i = 0; i < Orbit.values.length; i++) {
      final orbitId = Orbit.values[i];
      if (hasChild(orbitId)) {
        final orbitConstraints = sunSize + orbitOffset * (i.toDouble() + 1);
        final orbitSize = layoutChild(
          orbitId,
          BoxConstraints.tight(orbitConstraints),
        );
        positionChild(orbitId, _centeredOffset(size, orbitSize));
      }
    }

    // Layout Planets
    for (int i = 0; i < planetAnimations.length; i++) {
      final MapEntry(key: planetId, value: animation) =
          planetAnimations.entries.elementAt(i);

      if (hasChild(planetId)) {
        final startAngle = i * 180.0;
        final radius = sunRadius + ((orbitIncrement * (i + 1)) / 2);
        final animatedOrbitOffset = _animatedOrbitOffset(
          startAngle,
          radius,
          animation,
        );
        final planetSize = layoutChild(
          planetId,
          BoxConstraints.tight(Size.square(size.width * 0.1)),
        );

        positionChild(
          planetId,
          _centeredOffset(size, planetSize) + animatedOrbitOffset,
        );
      }
    }
  }

  Offset _centeredOffset(Size size, Size childSize) => Offset(
        size.width / 2 - childSize.width / 2,
        size.height / 2 - childSize.height / 2,
      );

  Offset _animatedOrbitOffset(
    double startAngle,
    double radius,
    Animation animation,
  ) {
    final radians = startAngle + vector_math.radians(360) * animation.value;
    return Offset(
      radius * math.cos(radians),
      radius * math.sin(radians),
    );
  }

  @override
  bool shouldRelayout(covariant _SolarSystemLayoutDelegate oldDelegate) =>
      planetAnimations != oldDelegate.planetAnimations;
}

class _OrbitPath extends StatelessWidget {
  const _OrbitPath(this.orbit);

  final Orbit orbit;

  @override
  Widget build(BuildContext context) {
    return LayoutId(
      id: orbit,
      child: const _CircleBorder(opacity: 0.3),
    );
  }
}

class _Planet extends StatelessWidget {
  const _Planet({
    required this.celestialBody,
    required this.child,
  });

  final CelestialBody celestialBody;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutId(
      id: celestialBody,
      child: _CircleBorder(
        child: Container(
          alignment: Alignment.center,
          padding: responsiveValue(
            context,
            mobile: const EdgeInsets.all(8),
            tablet: const EdgeInsets.all(12),
            desktop: const EdgeInsets.all(10),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _CircleBorder extends StatelessWidget {
  const _CircleBorder({
    this.opacity = 1,
    this.child,
  });

  final double opacity;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.background,
      ),
      foregroundDecoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(opacity),
          width: 2,
        ),
      ),
      child: child,
    );
  }
}
