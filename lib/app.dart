import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:profile_site/utils/helpers.dart';

import 'providers/app_theme_mode/app_theme_mode.dart';
import 'screens/home/home.dart';
import 'theme/theme.dart';

class ProfileApp extends ConsumerWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Benjamin Otto',
      debugShowCheckedModeBanner: false,
      // Animated theme switching is janky on mobile browsers, so
      // I've disabled it for mobile :(
      themeMode: responsiveValue(
        context,
        mobile: ThemeMode.dark,
        desktop: ref.watch(appThemeModeProvider),
      ),
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeAnimationDuration: const Duration(milliseconds: 500),
      home: const SelectionArea(child: HomeScreen()),
    );
  }
}
