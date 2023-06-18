import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/nav_visibility/nav_visibility.dart';
import '../../providers/section_scroll/section_scroll_state.dart';
import '../../theme/theme.dart';
import '../../utils/extensions.dart';
import 'menu_buttons.dart';

class NavBar extends ConsumerWidget {
  const NavBar({super.key});

  List<Widget> get _items => [
        const HomeButton(),
        const Spacer(),
        const MenuButton(text: 'About', section: Section.about),
        const MenuButton(text: 'Projects', section: Section.projects),
        const MenuButton(text: 'Brands', section: Section.brands),
        const MenuButton(text: 'Contact', section: Section.contact),
      ].withSpaceBetween(width: 24);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:colorScheme) = Theme.of(context);

    return AnimatedSlide(
      offset: ref.watch(navVisibilityProvider).navBarVisible
          ? const Offset(0, 0)
          : const Offset(0, -1),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutSine,
      child: PhysicalModel(
        color: Colors.transparent,
        elevation: 12,
        child: Container(
          height: 80,
          width: double.infinity,
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.symmetric(horizontal: 64),
          decoration: BoxDecoration(
            color: colorScheme.background,
            border: Border(
              bottom: BorderSide(
                color: colorScheme.primary.withOpacity(0.5),
                width: 1,
              ),
            ),
          ),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: AppTheme.contentMaxWidth,
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(children: _items),
          ),
        ),
      ),
    );
  }
}
