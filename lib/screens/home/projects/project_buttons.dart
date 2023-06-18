import 'package:flutter/material.dart';

import '../../../utils/helpers.dart';

class DownloadButton extends StatefulWidget {
  const DownloadButton({
    super.key,
    required this.imagePath,
    required this.url,
  });

  final String imagePath;
  final String url;

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _hovering ? 0.7 : 1,
      duration: const Duration(milliseconds: 100),
      child: MouseRegion(
        onEnter: (event) => setState(() => _hovering = true),
        onExit: (event) => setState(() => _hovering = false),
        child: TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: () => openUrl(widget.url),
          child: Image.asset(
            widget.imagePath,
            height: responsiveValue(context, mobile: 32, desktop: 40),
          ),
        ),
      ),
    );
  }
}

class TechButton extends StatelessWidget {
  const TechButton({
    super.key,
    required this.imagePath,
    required this.url,
    required this.tooltipMessage,
  });

  final String imagePath;
  final String url;
  final String tooltipMessage;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltipMessage,
      child: IconButton(
        onPressed: () => openUrl(url),
        icon: Image.asset(
          imagePath,
          height: responsiveValue(
            context,
            mobile: 20,
            desktop: 24,
          ),
        ),
      ),
    );
  }
}
