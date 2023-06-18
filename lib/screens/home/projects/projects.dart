import 'package:flutter/material.dart';

import '../../../constants/image_paths.dart';
import 'project_container.dart';
import 'project_buttons.dart';

ProjectContainer get thaiWordOfTheDayApp => ProjectContainer(
      title: 'Thai Word of the Day',
      description:
          'As an avid language learner I noticed we were missing a decent '
          'word of the day app for the Thai language, so I designed and built one. '
          'Each day receive a new Thai word with multiple definitions, '
          'example sentences, and more.\n\n'
          'The app employs multiple services from Firebase including: '
          'Firestore, Messaging, AdMob, Functions, Authentication, '
          'Analytics, Crashlytics, and AppCheck.',
      imagePath: Projects.thaiWordOfTheDay,
      direction: SlideDirection.leftToRight,
      projectColor: const Color(0xFFFFCC4D),
      techButtons: [_dart, _flutter, _firebase, _bloc],
      downloadButton: const DownloadButton(
        imagePath: Logos.googlePlay,
        url:
            'https://play.google.com/store/apps/details?id=io.ottoman.thaiwordoftheday',
      ),
    );

ProjectContainer get animatedFlightPathsPackage => ProjectContainer(
      title: 'Animated Flight Paths Package',
      description: 'While building this site I decided I wanted to include '
          'a bit of background about where I\'ve lived throughout the world. '
          'In doing so I started to implement a custom painter for animating '
          'flight paths across a world map.\n\nAs I was developing the feature for '
          'this site it dawned upon me that others might find it useful or fun '
          'too so I separated it out into its own package. Bon voyage! ✈️',
      imagePath: Projects.animatedFlightPaths,
      direction: SlideDirection.rightToLeft,
      projectColor: const Color(0xFF47F3FF),
      techButtons: [_dart, _flutter],
      downloadButton: const DownloadButton(
        imagePath: Logos.pubDev,
        url: 'https://pub.dev/packages/animated_flight_paths',
      ),
    );

ProjectContainer get multiBorderPackage => ProjectContainer(
      imagePath: Projects.multiBorder,
      title: 'MultiBorder Package',
      description: 'While working on a project I needed a way to add two '
          'borders around a container.  The way to do so in Flutter is a bit '
          'verbose and I figured I may want to use this decoration again in the '
          'future, so here you have the birth of the MultiBorder package.',
      direction: SlideDirection.leftToRight,
      projectColor: const Color(0xFFF14A42),
      techButtons: [_dart, _flutter],
      downloadButton: const DownloadButton(
        imagePath: Logos.pubDev,
        url: 'https://pub.dev/packages/multi_border',
      ),
    );

ProjectContainer get portfolioSite => ProjectContainer(
      imagePath: Projects.portfolioSite,
      title: 'Portfolio Site',
      description:
          'Yo dawg, I herd you like Flutter sites so I put a Flutter site in '
          'this Flutter site.\n\n'
          'In all seriousness though, I figured I\'m a Flutter dev so I should '
          'build my portfolio site with Flutter. So that\'s what I\'ve done.',
      direction: SlideDirection.rightToLeft,
      projectColor: const Color(0xFFF6C427),
      techButtons: [_dart, _flutter, _riverpod, _flutterHooks],
    );

ProjectContainer get comingSoon => ProjectContainer(
      imagePath: Projects.comingSoon,
      title: 'Language Tuner',
      description:
          'A work in progress here. Language Tuner (name yet confirmed) will '
          'focus on improving the language learner\'s listening skills. The '
          'app will be marketed towards a more niche crowd of upper '
          'intermediate to advanced learners. Stay tuned for updates!',
      direction: SlideDirection.leftToRight,
      projectColor: const Color(0xFF06D6A0),
      techButtons: [_dart, _flutter, _firebase],
    );

TechButton get _dart => const TechButton(
      imagePath: Logos.dart,
      url: 'https://dart.dev/',
      tooltipMessage: 'Dart',
    );

TechButton get _flutter => const TechButton(
      imagePath: Logos.flutter,
      url: 'https://flutter.dev/',
      tooltipMessage: 'Flutter',
    );

TechButton get _firebase => const TechButton(
      imagePath: Logos.firebase,
      url: 'https://firebase.google.com/',
      tooltipMessage: 'Firebase',
    );

TechButton get _bloc => const TechButton(
      imagePath: Logos.bloc,
      url: 'https://bloclibrary.dev/#/',
      tooltipMessage: 'Bloc Library',
    );

TechButton get _riverpod => const TechButton(
      imagePath: Logos.riverpod,
      url: 'https://riverpod.dev/',
      tooltipMessage: 'Riverpod Framework',
    );

TechButton get _flutterHooks => const TechButton(
      imagePath: Logos.flutterHooks,
      url: 'https://pub.dev/packages/flutter_hooks',
      tooltipMessage: 'Flutter Hooks',
    );
