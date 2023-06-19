import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
      themeAnimationDuration: const Duration(milliseconds: 400),
      themeAnimationCurve: Curves.easeOutSine,
      home: const SelectionArea(child: HomeScreen()),
    );
  }
}
