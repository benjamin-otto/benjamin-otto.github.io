import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTheme {
  AppTheme(ColorScheme colorScheme) : _colorScheme = colorScheme;

  final ColorScheme _colorScheme;

  static final dark = AppTheme(darkColors).themeData;

  static final light = AppTheme(lightColors).themeData;

  static const contentMaxWidth = 1200.0;

  static const borderWidth = 2.0;

  get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: _colorScheme,
        scaffoldBackgroundColor: _colorScheme.background,
        textTheme: _textTheme,
        textButtonTheme: _textButtonTheme,
        outlinedButtonTheme: _outlinedButtonTheme,
        iconButtonTheme: iconButtonTheme,
        inputDecorationTheme: _inputDecorationTheme,
        textSelectionTheme: _textSelectionTheme,
        tooltipTheme: _tooltipTheme,
      );

  get _textTheme => GoogleFonts.nunitoTextTheme()
      .copyWith(
        titleMedium: GoogleFonts.mulish(fontWeight: FontWeight.w700),
        headlineSmall: GoogleFonts.robotoSlab(fontWeight: FontWeight.w600),
        bodyMedium: GoogleFonts.mulish(fontWeight: FontWeight.w600),
        bodySmall: GoogleFonts.mulish(fontWeight: FontWeight.w600),
      )
      .apply(
        bodyColor: _colorScheme.onBackground,
        displayColor: _colorScheme.onBackground,
      );

  get _textButtonTheme => TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _colorScheme.onBackground,
        ),
      );

  get _outlinedButtonTheme => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _colorScheme.onBackground,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          side: BorderSide(color: _colorScheme.primary, width: borderWidth),
        ),
      );

  get iconButtonTheme => IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: _colorScheme.onBackground,
        ),
      );

  get _inputDecorationTheme => InputDecorationTheme(
        contentPadding: const EdgeInsets.all(16),
        labelStyle: _textTheme.bodyMedium?.copyWith(
          color: _colorScheme.primary,
        ),
        errorStyle: _textTheme.labelSmall?.copyWith(color: _colorScheme.error),
        errorBorder: _inputBorder,
        focusedErrorBorder: _inputBorder,
        enabledBorder: _inputBorder,
        focusedBorder: _inputBorder,
      );

  get _tooltipTheme => TooltipThemeData(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        textStyle: TextStyle(color: _colorScheme.onBackground),
        decoration: ShapeDecoration(
          color: _colorScheme.primary,
          shape: const StadiumBorder(),
        ),
      );

  get _textSelectionTheme => TextSelectionThemeData(
        cursorColor: _colorScheme.primary,
        selectionColor: _colorScheme.primary.withOpacity(0.5),
        selectionHandleColor: _colorScheme.primary,
      );

  get _inputBorder => const OutlineInputBorder(
        gapPadding: 8,
        borderSide: BorderSide(color: Colors.transparent),
      );
}
