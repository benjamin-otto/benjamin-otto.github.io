import 'package:flutter/material.dart';

import '../../../constants/image_paths.dart';
import 'project_container.dart';
import 'project_buttons.dart';

ProjectContainer get lotusMerchantApp => ProjectContainer(
      title: 'Lotus\'s Merchant',
      description:
          'The food delivery service industry has exploded in Thailand over the '
          'last few years. In an effort to capture part of this demand Lotus\'s '
          '(one of Thailand\'s largest retail chains) has created the Lotus\'s '
          'Merchant app.\n\nFor use by restaurant merchants and run on the Sunmi V2 '
          'Pro point of sale device, the app gives merchants a central place to '
          'manage the operations of their business.  Features include delivery '
          'order coordination, inventory management, coupon tracking, and staffing '
          'controls.',
      imagePath: Projects.lotusMerchant,
      direction: SlideDirection.leftToRight,
      projectColor: const Color(0xFF00BCB5),
      techButtons: [_dart, _flutter, _firebase, _bloc],
    );

ProjectContainer get eggPOSApp => ProjectContainer(
      title: 'Egg POS',
      description:
          'Egg POS is a store management system that gives business owners '
          'access to the workings of their store anytime anywhere.\n\nThe app '
          'is suitable for retail stores, restaurants, cafes, as well as '
          'many other types of businesses.  Features include merchandise '
          'management, inventory tracking, staff scheduling, and payment services.',
      imagePath: Projects.eggPOS,
      direction: SlideDirection.rightToLeft,
      projectColor: const Color(0xFFFBD606),
      techButtons: [_dart, _flutter, _firebase, _bloc],
      downloadButton: const DownloadButton(
        imagePath: Logos.googlePlay,
        url:
            'https://play.google.com/store/apps/details?id=com.eggdigital.horeca.eggpos&hl=en_US&gl=US',
      ),
    );

ProjectContainer get manaoMealsApp => ProjectContainer(
      title: 'Manao Meals',
      description:
          'One of the many benefits of working with Manao Software was a free '
          'daily meal allowance for all employees. In an effort to coordinate meal '
          'ordering amongst the employees we created the Manao Meals mobile app.\n\n'
          'Manao Meals gives users an easy way to manage their upcoming meal '
          'schedule. Within the app you can place, update, and removed orders for '
          'the week. Users are allotted a set number of tokens they can use for '
          'each meal. These tokens are then deducted from their account '
          'according to each meal\'s cost. Users are sent push notifications to '
          'remind them to place their orders before the ordering deadline. '
          'Manao Meals has successfully been adopted by the employees company-wide.',
      imagePath: Projects.manaoMeals,
      direction: SlideDirection.leftToRight,
      projectColor: const Color(0xFF93D500),
      techButtons: [_dart, _flutter, _getX],
      downloadButton: const DownloadButton(
        imagePath: Logos.googlePlay,
        url:
            'https://play.google.com/store/apps/details?id=com.manaosoftware.lunchnao&gl=th',
      ),
    );

ProjectContainer get thaiWordOfTheDayApp => ProjectContainer(
      title: 'Thai Word of the Day',
      description:
          'As an avid language learner I noticed we were missing a decent '
          'word of the day app for the Thai language, so I designed and built one. '
          'Each day the user receives a new Thai word with multiple definitions, '
          'example sentences, compound words, phonemics and more. Users have the '
          'option to save their favorite words to study later. The app also lets '
          'users choose to slow down speech playback or space out Thai words to '
          'ease studying for beginners.\n\n'
          'The app employs multiple services from Firebase including: '
          'Firestore, Messaging, AdMob, Functions, Authentication, '
          'Analytics, Crashlytics, and AppCheck.',
      imagePath: Projects.thaiWordOfTheDay,
      direction: SlideDirection.rightToLeft,
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
          'flight paths across a world map.\n\nAs I was developing the feature '
          'it dawned upon me that others might find it useful or fun '
          'too so I separated it out into its own package. Bon voyage! ✈️',
      imagePath: Projects.animatedFlightPaths,
      direction: SlideDirection.leftToRight,
      projectColor: const Color(0xFFAF238B),
      techButtons: [_dart, _flutter],
      downloadButton: const DownloadButton(
        imagePath: Logos.pubDev,
        url: 'https://pub.dev/packages/animated_flight_paths',
      ),
    );

ProjectContainer get multiBorderPackage => ProjectContainer(
      imagePath: Projects.multiBorder,
      title: 'MultiBorder Package',
      description: 'As part of another project I needed a way to add two '
          'borders around a container. The way to do so in Flutter is a bit '
          'verbose and I figured I may want to use this decoration again in the '
          'future, so here you have the birth of the MultiBorder package.',
      direction: SlideDirection.rightToLeft,
      projectColor: const Color(0xFFF27D3B),
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
          'Being a Flutter dev I figured I should build my Flutter portfolio site '
          'with Flutter, so that\'s exactly what I\'ve done.\n\n'
          'Flutter Flutter Flutter!',
      direction: SlideDirection.leftToRight,
      projectColor: const Color(0xFF45D1FD),
      techButtons: [_dart, _flutter, _riverpod, _flutterHooks],
    );

ProjectContainer get languageTuner => ProjectContainer(
      imagePath: Projects.languageTuner,
      title: 'Language Tuner',
      description:
          'Language Tuner (name yet confirmed) is my next venture into the language '
          'learning space. The app will focus on improving the language learner\'s '
          'listening skills. It will be marketed towards a more niche crowd of upper '
          'intermediate to advanced learners. Stay tuned for updates!',
      direction: SlideDirection.rightToLeft,
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

TechButton get _getX => const TechButton(
      imagePath: Logos.getX,
      url: 'https://pub.dev/packages/get',
      tooltipMessage: 'GetX',
    );
