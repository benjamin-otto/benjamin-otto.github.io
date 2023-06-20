import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../nav_visibility/nav_visibility.dart';
import 'section_scroll_state.dart';

part 'section_scroll.g.dart';

@riverpod
class SectionScroll extends _$SectionScroll {
  @override
  SectionScrollState build() => SectionScrollState(
        itemScrollController: ItemScrollController(),
        scrollingToSection: false,
      );

  void setScrollingToSection(bool scrolling) {
    state = state.copyWith(scrollingToSection: scrolling);
  }

  Future<void> scrollToSection(Section section) async {
    setScrollingToSection(true);
    ref.read(navVisibilityProvider.notifier)
      ..setHamburgerMenuVisible(false)
      ..setHamburgerButtonVisible(false);
    await state.itemScrollController.scrollTo(
      index: section.index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutSine,
    );
    setScrollingToSection(false);
  }
}
