import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../utils/extensions.dart';
import '../../../utils/helpers.dart';
import '../../../widgets/translucent_background.dart';
import 'project_buttons.dart';

enum SlideDirection { leftToRight, rightToLeft }

class ProjectContainer extends HookWidget {
  const ProjectContainer({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.direction,
    required this.projectColor,
    required this.techButtons,
    this.downloadButton,
  });

  final String title;
  final String description;
  final String imagePath;
  final SlideDirection direction;
  final Color projectColor;
  final List<TechButton> techButtons;
  final DownloadButton? downloadButton;

  @override
  Widget build(BuildContext context) {
    final controller =
        useAnimationController(duration: const Duration(seconds: 1));
    final position = Tween<Offset>(
      begin: switch (direction) {
        SlideDirection.leftToRight => const Offset(-2, 0),
        SlideDirection.rightToLeft => const Offset(2, 0),
      },
      end: Offset.zero,
    )
        .chain(CurveTween(curve: Curves.fastEaseInToSlowEaseOut))
        .animate(controller);

    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        if (controller.status == AnimationStatus.completed) return;
        if (info.percentVisible > 10) controller.forward();
      },
      child: FadeTransition(
        opacity: controller,
        child: SlideTransition(
          position: position,
          child: responsiveValue(
            context,
            mobile: _mobile(context),
            desktop: _desktop(context),
          ),
        ),
      ),
    );
  }

  Widget _mobile(BuildContext context) {
    return Column(
      children: [
        _projectImage,
        const SizedBox(height: 24),
        _projectInfo(context, false),
      ],
    );
  }

  Widget _desktop(BuildContext context) {
    return Column(
      children: [
        _projectImage,
        const SizedBox(height: 24),
        Expanded(child: _projectInfo(context, true)),
      ],
    );
  }

  Widget get _projectImage => Card(
        elevation: 12,
        color: Colors.transparent,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: AspectRatio(
          aspectRatio: 1024 / 500,
          child: Image.asset(imagePath),
        ),
      );

  Widget _projectInfo(BuildContext context, bool includeSpacer) =>
      TranslucentBackground(
        color: projectColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _projectTitle(context),
              const SizedBox(height: 8),
              _projectDescription(context),
              const SizedBox(height: 12),
              if (includeSpacer) const Spacer(),
              _buttonRow,
            ],
          ),
        ),
      );

  Widget _projectTitle(BuildContext context) => FittedBox(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      );

  Widget _projectDescription(BuildContext context) => Text(
        description,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.justify,
      );

  Widget get _buttonRow => Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (downloadButton != null) ...[
              downloadButton!,
              const SizedBox(width: 8),
            ],
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: FittedBox(
                  child: Row(children: techButtons),
                ),
              ),
            ),
          ],
        ),
      );
}
