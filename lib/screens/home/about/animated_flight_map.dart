import 'package:animated_flight_paths/animated_flight_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../theme/colors.dart';
import '../../../theme/theme.dart';
import '../../../utils/helpers.dart';
import '../../../widgets/translucent_background.dart';

class AnimatedFlightMap extends StatefulHookWidget {
  const AnimatedFlightMap({super.key});

  @override
  State<AnimatedFlightMap> createState() => AnimatedFlightMapState();
}

class AnimatedFlightMapState extends State<AnimatedFlightMap>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final ThemeData(:colorScheme) = Theme.of(context);
    final controller = useAnimationController(
      duration: const Duration(seconds: 30),
    )..repeat();

    return TranslucentBackground(
      axis: Axis.vertical,
      child: Container(
        padding: responsiveValue(
          context,
          mobile: const EdgeInsets.all(24),
          tablet: const EdgeInsets.all(32),
          desktop: const EdgeInsets.all(40),
        ),
        child: AnimatedFlightPaths(
          controller: controller,
          flightSchedule: FlightSchedule(
            start: DateTime.parse('2023-01-01 00:00:00'),
            end: DateTime.parse('2023-01-06 20:00:00'),
            flights: _flights,
          ),
          options: FlightPathOptions(
            endpointRadius: 4,
            fromEndpointColor: colorScheme.secondary,
            flightPathColor: colorScheme.secondary,
            toEndpointColor: colorScheme.secondary,
            endpointWeight: 0.2,
          ),
          child: MapSvg(
            map: FlightMap.worldMercatorProjection,
            outlineColor: colorScheme.primary,
            fillColor: NeonColors.primary.withOpacity(0.05),
          ),
        ),
      ),
    );
  }

  final _flights = <Flight>[
    Flight(
      from: Cities.kansasCity,
      to: Cities.chiangMai,
      departureTime: DateTime.parse('2023-01-01 00:00:00'),
      arrivalTime: DateTime.parse('2023-01-01 23:00:00'),
    ),
    Flight(
      from: Cities.chiangMai,
      to: Cities.brande,
      departureTime: DateTime.parse('2023-01-02 05:00:00'),
      arrivalTime: DateTime.parse('2023-01-03 00:00:00'),
    ),
    Flight(
      from: Cities.brande,
      to: Cities.beneVagienna,
      departureTime: DateTime.parse('2023-01-03 05:00:00'),
      arrivalTime: DateTime.parse('2023-01-03 16:00:00'),
    ),
    Flight(
      from: Cities.beneVagienna,
      to: Cities.kansasCity,
      departureTime: DateTime.parse('2023-01-03 21:00:00'),
      arrivalTime: DateTime.parse('2023-01-04 11:00:00'),
    ),
    Flight(
      from: Cities.kansasCity,
      to: Cities.chiangMai,
      departureTime: DateTime.parse('2023-01-04 17:00:00'),
      arrivalTime: DateTime.parse('2023-01-05 16:00:00'),
    ),
    Flight(
      from: Cities.chiangMai,
      to: Cities.napa,
      departureTime: DateTime.parse('2023-01-05 21:00:00'),
      arrivalTime: DateTime.parse('2023-01-06 16:00:00'),
    ),
  ];

  @override
  bool get wantKeepAlive => true;
}

abstract final class Cities {
  static final kansasCity = FlightEndpoint(
    offset: const Offset(21, 53),
    label: const _Label(text: 'Kansas City'),
  );

  static final chiangMai = FlightEndpoint(
    offset: const Offset(75, 64),
    label: const _Label(text: 'Chiang Mai'),
  );

  static final brande = FlightEndpoint(
    offset: const Offset(51, 42),
    label: const _Label(text: 'Brande'),
  );

  static final beneVagienna = FlightEndpoint(
    offset: const Offset(51, 50),
    label: const _Label(text: 'Bene Vagienna'),
  );

  static final napa = FlightEndpoint(
    offset: const Offset(15, 53),
    label: const _Label(text: 'Napa'),
  );
}

class _Label extends StatelessWidget {
  const _Label({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final ThemeData(:colorScheme, :textTheme) = Theme.of(context);

    return Container(
      padding: responsiveValue(
        context,
        mobile: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        desktop: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      ),
      decoration: ShapeDecoration(
        color: colorScheme.background,
        shape: const StadiumBorder(
          side: BorderSide(
            color: NeonColors.primary,
            width: AppTheme.borderWidth,
          ),
        ),
      ),
      child: Text(
        text,
        style: textTheme.bodySmall?.copyWith(
          color: NeonColors.primary,
          fontSize: responsiveValue(context, mobile: 10, desktop: 12),
        ),
      ),
    );
  }
}
