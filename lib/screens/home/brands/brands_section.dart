import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../constants/image_paths.dart';
import '../../../theme/colors.dart';
import '../../../utils/helpers.dart';
import '../../../widgets/section/section_container.dart';
import '../../../widgets/section/section_description.dart';
import '../../../widgets/section/section_spacer.dart';
import '../../../widgets/section/section_title.dart';
import '../../../widgets/translucent_background.dart';

class BrandsSection extends StatefulWidget {
  const BrandsSection({super.key});

  @override
  State<BrandsSection> createState() => _BrandsSectionState();
}

class _BrandsSectionState extends State<BrandsSection>
    with AutomaticKeepAliveClientMixin {
  final _scrollDuration = const Duration(seconds: 15);
  final _brandsTopController = ScrollController();
  final _brandsBottomController = ScrollController();
  final _scrollIncrement = 500;
  double _brandsTopOffset = 0;
  double _brandsBottomOffset = 0;
  Timer? _scrollTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startAutoScroll());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title,
          _description,
          const SectionSpacer(),
          _brandScrollers,
        ],
      ),
    );
  }

  Widget get _brandScrollers {
    return NotificationListener<ScrollNotification>(
      onNotification: (_) => true,
      child: TranslucentBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 64),
          child: Column(
            children: [
              _autoScrollingListView(
                controller: _brandsTopController,
                items: _brandsTop,
              ),
              SizedBox(
                height: responsiveValue(
                  context,
                  mobile: 48,
                  desktop: 96,
                ),
              ),
              _autoScrollingListView(
                controller: _brandsBottomController,
                items: _brandsBottom,
                reverse: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _title => SectionTitle(
        gradientColors: const [NeonColors.secondary, NeonColors.tertiary],
        texts: [
          SectionTitleText(text: 'A brief', includeGradient: false),
          SectionTitleText(text: ' history.', includeGradient: true),
        ],
      );

  Widget get _description => const SectionDescription(
        text: 'Here are a few of the companies and brands '
            'I\'ve worked with over the years.',
      );

  Widget _autoScrollingListView({
    required ScrollController controller,
    required List<Widget> items,
    bool reverse = false,
  }) {
    return MouseRegion(
      onEnter: (_) => _stopAutoScroll(),
      onExit: (_) => _startAutoScroll(),
      child: SizedBox(
        height: responsiveValue(
          context,
          mobile: 64,
          desktop: 100,
        ),
        child: ListView.builder(
          controller: controller,
          reverse: reverse,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, i) => items[i % items.length],
        ),
      ),
    );
  }

  List<Widget> get _brandsTop => const [
        _Brand(Brands.manao, 'https://manaosoftware.com/'),
        _Brand(Brands.ascend, 'https://www.ascendcorp.com/'),
        _Brand(Brands.lotuss, 'https://corporate.lotuss.com/en/'),
        _Brand(Brands.eggDigital, 'https://www.eggdigital.com/'),
        _Brand(Brands.aware, 'https://www.aware.co.th/'),
      ];

  List<Widget> get _brandsBottom => const [
        _Brand(Brands.braincloud, 'https://www.braincloudlearning.com/'),
        _Brand(Brands.rabbitRewards, 'https://rewards.rabbit.co.th/'),
        _Brand(Brands.roojai, 'https://www.roojai.com/en/'),
        _Brand(Brands.georgieLou, 'https://georgieandlou.com/'),
        _Brand(Brands.theCabin, 'https://thecabin.com/'),
      ];

  void _startAutoScroll() {
    _scrollToOffset();
    _scrollTimer = Timer.periodic(_scrollDuration, (_) => _scrollToOffset());
  }

  void _scrollToOffset() {
    if (_brandsTopController.hasClients) {
      _brandsTopOffset += _scrollIncrement;
      _brandsTopController.animateTo(
        _brandsTopOffset,
        duration: _scrollDuration,
        curve: Curves.linear,
      );
    }
    if (_brandsBottomController.hasClients) {
      _brandsBottomOffset += _scrollIncrement;
      _brandsBottomController.animateTo(
        _brandsBottomOffset,
        duration: _scrollDuration,
        curve: Curves.linear,
      );
    }
  }

  void _stopAutoScroll() {
    _scrollTimer?.cancel();
    _brandsTopOffset = _brandsTopController.offset;
    _brandsBottomOffset = _brandsBottomController.offset;
    _brandsTopController.jumpTo(_brandsTopOffset);
    _brandsBottomController.jumpTo(_brandsBottomOffset);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _brandsTopController.dispose();
    super.dispose();
  }
}

class _Brand extends HookWidget {
  const _Brand(this.brand, this.url);

  final String brand;
  final String url;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );
    final colorAnimation = ColorTween(
      begin: NeonColors.quaternary,
      end: Colors.transparent,
    ).animate(controller);

    return GestureDetector(
      onTap: () => openUrl(url),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => controller.forward(),
        onExit: (_) => controller.reverse(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64.0),
          child: AnimatedBuilder(
            animation: colorAnimation,
            child: Image.asset(brand, height: 32),
            builder: (context, child) => ColorFiltered(
              colorFilter: ColorFilter.mode(
                colorAnimation.value!,
                BlendMode.srcATop,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
