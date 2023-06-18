import 'package:flutter/material.dart';

@immutable
class NavVisibilityState {
  const NavVisibilityState({
    required this.navBarVisible,
    required this.hamburgerButtonVisible,
    required this.hamburgerMenuVisible,
  });

  final bool navBarVisible;
  final bool hamburgerButtonVisible;
  final bool hamburgerMenuVisible;

  NavVisibilityState copyWith({
    bool? navBarVisible,
    bool? hamburgerButtonVisible,
    bool? hamburgerMenuVisible,
  }) {
    return NavVisibilityState(
      navBarVisible: navBarVisible ?? this.navBarVisible,
      hamburgerButtonVisible:
          hamburgerButtonVisible ?? this.hamburgerButtonVisible,
      hamburgerMenuVisible: hamburgerMenuVisible ?? this.hamburgerMenuVisible,
    );
  }
}
