import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/section_scroll/section_scroll.dart';
import '../../providers/section_scroll/section_scroll_state.dart';
import '../../utils/helpers.dart';
import '../gradient_text.dart';

class MenuButton extends ConsumerWidget {
  const MenuButton({
    super.key,
    required this.text,
    required this.section,
  });

  final String text;
  final Section section;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SelectionContainer.disabled(
      child: TextButton(
        onPressed: () =>
            ref.read(sectionScrollProvider.notifier).scrollToSection(section),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}

class HomeButton extends ConsumerWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:colorScheme) = Theme.of(context);

    return SelectionContainer.disabled(
      child: TextButton(
        onPressed: () => ref
            .read(sectionScrollProvider.notifier)
            .scrollToSection(Section.hero),
        child: GradientText(
          text: 'Benjamin',
          colors: [colorScheme.primary, colorScheme.secondary],
          style: GoogleFonts.dancingScript(
            fontSize: responsiveValue(context, mobile: 20, desktop: 32),
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
