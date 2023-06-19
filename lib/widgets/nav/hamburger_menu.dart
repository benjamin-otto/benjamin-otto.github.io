import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/providers.dart';
import '../../providers/section_scroll/section_scroll_state.dart';
import 'menu_buttons.dart';

class HamburgerButton extends HookConsumerWidget {
  const HamburgerButton({super.key});

  final duration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:colorScheme) = Theme.of(context);
    final controller = useAnimationController(duration: duration);
    ref.listen(
      navVisibilityProvider.select((state) => state.hamburgerMenuVisible),
      (_, visible) => visible ? controller.forward() : controller.reverse(),
    );

    return AnimatedSlide(
      offset: ref.watch(navVisibilityProvider).hamburgerButtonVisible
          ? const Offset(0, 0)
          : const Offset(0, -1),
      duration: duration,
      child: PhysicalModel(
        color: Colors.transparent,
        elevation: 12,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: colorScheme.background,
            border: Border(
              bottom: BorderSide(
                color: colorScheme.primary.withOpacity(0.5),
                width: 1,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const HomeButton(),
              IconButton(
                onPressed: ref
                    .read(navVisibilityProvider.notifier)
                    .toggleHamburgerMenuVisible,
                style: IconButton.styleFrom(
                  backgroundColor: colorScheme.background,
                  foregroundColor: colorScheme.primary,
                ),
                icon: AnimatedIcon(
                  icon: AnimatedIcons.close_menu,
                  progress: Tween(begin: 1.0, end: 0.0).animate(
                    CurvedAnimation(
                      parent: controller,
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HamburgerMenu extends ConsumerWidget {
  const HamburgerMenu({super.key});

  final duration = const Duration(milliseconds: 300);

  List<Widget> get _items => const [
        // HomeButton(),
        MenuButton(text: 'About', section: Section.about),
        MenuButton(text: 'Projects', section: Section.projects),
        MenuButton(text: 'Brands', section: Section.brands),
        MenuButton(text: 'Contact', section: Section.contact),
      ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const curve = Curves.fastOutSlowIn;
    final visible = ref.watch(
        navVisibilityProvider.select((state) => state.hamburgerMenuVisible));

    return AnimatedOpacity(
      opacity: visible ? 1 : 0,
      duration: duration,
      curve: curve,
      child: AnimatedSlide(
        offset: visible ? const Offset(0, 0) : const Offset(0, -1),
        duration: duration,
        curve: curve,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(32),
          color: Theme.of(context).colorScheme.background,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: _items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 24),
            itemBuilder: (_, i) => Center(child: _items[i]),
          ),
        ),
      ),
    );
  }
}
