import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../providers/nav_visibility/nav_visibility.dart';
import '../providers/section_scroll/section_scroll.dart';
import '../utils/helpers.dart';
import '../widgets/nav/hamburger_menu.dart';
import '../widgets/nav/nav_bar.dart';
import '../widgets/whack_a_mole.dart';

class Screen extends ConsumerWidget {
  const Screen({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: NotificationListener<ScrollUpdateNotification>(
          onNotification: (notification) {
            if (notification.scrollDelta != null) {
              _updateNavVisibility(ref, notification.scrollDelta!);
            }
            return false;
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              ScrollablePositionedList.builder(
                physics: const ClampingScrollPhysics(),
                itemScrollController:
                    ref.watch(sectionScrollProvider).itemScrollController,
                itemCount: children.length,
                itemBuilder: (_, i) => children[i],
              ),
              ...responsiveValue(
                context,
                desktop: [_navbar],
                mobile: [const HamburgerMenu(), _hamburgerButton],
              ),
              const WhackAMole(),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _navbar => const Align(
        alignment: Alignment.topCenter,
        child: NavBar(),
      );

  Widget get _hamburgerButton => const Align(
        alignment: Alignment.topRight,
        child: HamburgerButton(),
      );

  void _updateNavVisibility(WidgetRef ref, double scrollDelta) {
    final scrollingDown = scrollDelta > 0;
    final scrollingUp = scrollDelta < 0;
    final scrollingToSection =
        ref.read(sectionScrollProvider).scrollingToSection;
    final navVisNotifier = ref.read(navVisibilityProvider.notifier);
    final (navBarVisible, hamburgerButtonVisible) =
        ref.read(navVisibilityProvider.select((state) => (
              state.navBarVisible,
              state.hamburgerButtonVisible,
            )));

    if (scrollingDown && !scrollingToSection) {
      if (navBarVisible) {
        navVisNotifier.setNavBarVisible(false);
      }
      if (hamburgerButtonVisible) {
        navVisNotifier.setHamburgerButtonVisible(false);
      }
    } else if (scrollingUp) {
      if (!navBarVisible) {
        navVisNotifier.setNavBarVisible(true);
      }
      if (!hamburgerButtonVisible) {
        navVisNotifier.setHamburgerButtonVisible(true);
      }
    }
  }
}
