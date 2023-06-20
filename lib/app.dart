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
      themeMode: ref.watch(appThemeModeProvider),
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeAnimationDuration: Duration(
        milliseconds: responsiveValue(
          context,
          mobile: 50, // animation janky on mobile, so do it quickly
          desktop: 500,
        ),
      ),
      home: const SelectionArea(child: HomeScreen()),
    );
  }
}
