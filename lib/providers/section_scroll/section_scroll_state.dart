import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

enum Section { hero, about, projects, brands, contact }

class SectionScrollState {
  SectionScrollState({
    required this.itemScrollController,
    required this.scrollingToSection,
  });

  final ItemScrollController itemScrollController;
  final bool scrollingToSection;

  SectionScrollState copyWith({
    ItemScrollController? itemScrollController,
    bool? scrollingToSection,
  }) {
    return SectionScrollState(
      itemScrollController: itemScrollController ?? this.itemScrollController,
      scrollingToSection: scrollingToSection ?? this.scrollingToSection,
    );
  }
}
