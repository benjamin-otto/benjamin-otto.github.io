import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'nav_visibility_state.dart';

part 'nav_visibility.g.dart';

@riverpod
class NavVisibility extends _$NavVisibility {
  @override
  NavVisibilityState build() => const NavVisibilityState(
        navBarVisible: true,
        hamburgerButtonVisible: true,
        hamburgerMenuVisible: false,
      );

  void setNavBarVisible(bool visible) {
    state = state.copyWith(navBarVisible: visible);
  }

  void setHamburgerButtonVisible(bool visible) {
    state = state.copyWith(hamburgerButtonVisible: visible);
  }

  void setHamburgerMenuVisible(bool visible) {
    state = state.copyWith(hamburgerMenuVisible: visible);
  }

  void toggleHamburgerMenuVisible() {
    state = state.copyWith(hamburgerMenuVisible: !state.hamburgerMenuVisible);
  }
}
