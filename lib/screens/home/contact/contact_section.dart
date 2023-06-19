import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/image_paths.dart';
import '../../../utils/extensions.dart';
import '../../../utils/helpers.dart';
import '../../../utils/textfield_validator.dart';
import '../../../widgets/section/section_container.dart';
import '../../../widgets/section/section_description.dart';
import '../../../widgets/section/section_spacer.dart';
import '../../../widgets/section/section_title.dart';
import '../../../widgets/translucent_background.dart';

class ContactSection extends StatefulHookWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _subjectController;
  late TextEditingController _messageController;
  late AnimationController _lottieController;
  bool _lottieVisible = false;
  bool _sendButtonEnabled = true;

  @override
  Widget build(BuildContext context) {
    _emailController = useTextEditingController();
    _subjectController = useTextEditingController();
    _messageController = useTextEditingController();
    _lottieController = useAnimationController()
      ..addStatusListener((status) {
        (status == AnimationStatus.forward)
            ? setState(() => _lottieVisible = true)
            : setState(() => _lottieVisible = false);
      });

    return SectionContainer(
      child: Container(
        clipBehavior: Clip.antiAlias,
        constraints: const BoxConstraints(maxWidth: 800),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _title,
                _description,
                const SectionSpacer(),
                _contactForm,
              ],
            ),
            Visibility(
              visible: _lottieVisible,
              maintainState: true,
              child: _messageSentLottie,
            ),
            // _customSnackbar,
          ],
        ),
      ),
    );
  }

  Widget get _title {
    final ThemeData(:colorScheme) = Theme.of(context);
    return SectionTitle(
      gradientColors: [colorScheme.primary, colorScheme.secondary],
      texts: [
        SectionTitleText(text: 'Let\'s'),
        SectionTitleText(text: ' talk.', includeGradient: true),
      ],
    );
  }

  Widget get _description => SectionDescription(
        text: 'Looking for a Flutter developer? Shoot me a message!',
        color: Theme.of(context).colorScheme.onSurface,
      );

  Widget get _contactForm {
    return NotificationListener<ScrollNotification>(
      onNotification: (_) => true,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _wrapTranslucentBackground(
              Container(
                height: 64,
                alignment: Alignment.center,
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Your Email'),
                  keyboardType: TextInputType.emailAddress,
                  inputFormatters: [LengthLimitingTextInputFormatter(100)],
                  validator: (email) => InputValidator([
                    Validators.isNotEmpty,
                    Validators.isValidEmail,
                  ]).validate(email),
                ),
              ),
            ),
            _wrapTranslucentBackground(
              Container(
                height: 64,
                alignment: Alignment.center,
                child: TextFormField(
                  controller: _subjectController,
                  decoration: const InputDecoration(labelText: 'Subject'),
                  keyboardType: TextInputType.text,
                  inputFormatters: [LengthLimitingTextInputFormatter(100)],
                  validator: (subject) => InputValidator([
                    Validators.isNotEmpty,
                  ]).validate(subject),
                ),
              ),
            ),
            _wrapTranslucentBackground(
              Container(
                height: 200,
                alignment: Alignment.center,
                child: TextFormField(
                  controller: _messageController,
                  maxLines: 5,
                  decoration: const InputDecoration(labelText: 'Message'),
                  keyboardType: TextInputType.multiline,
                  inputFormatters: [LengthLimitingTextInputFormatter(500)],
                  validator: (message) => InputValidator([
                    Validators.isNotEmpty,
                  ]).validate(message),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton.icon(
                icon: const Icon(FontAwesomeIcons.paperPlane, size: 12),
                label: const Text('Send'),
                onPressed: _sendButtonEnabled ? _submitForm : null,
                style: Theme.of(context).outlinedButtonTheme.style!.copyWith(
                      padding: MaterialStatePropertyAll(
                        responsiveValue(
                          context,
                          mobile: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                          desktop: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 24,
                          ),
                        ),
                      ),
                    ),
              ),
            ),
          ].withSpaceBetween(height: 12),
        ),
      ),
    );
  }

  Widget _wrapTranslucentBackground(Widget child) => TranslucentBackground(
        color: Theme.of(context).colorScheme.primary,
        bracketDepth: 8,
        child: child,
      );

  Widget get _messageSentLottie => Lottie.asset(
        Lotties.messageSent,
        controller: _lottieController,
        height: 256,
        onLoaded: (composition) {
          _lottieController.duration = composition.duration;
        },
      );

  Future<void> _submitForm() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    try {
      setState(() => _sendButtonEnabled = false);
      await _postToFormSpree();
      _clearForm();
      _showSuccessSnackbar();
      await _lottieController.forward(from: 0);
    } on DioException {
      _showErrorSnackbar();
    } finally {
      setState(() => _sendButtonEnabled = true);
    }
  }

  Future<void> _postToFormSpree() async {
    await Dio().post(
      'https://formspree.io/f/mwkjgrpq',
      data: {
        'email': _emailController.text,
        'subject': _subjectController.text,
        'message': _messageController.text,
      },
    );
  }

  void _clearForm() {
    _formKey.currentState?.reset();
    _emailController.clear();
    _subjectController.clear();
    _messageController.clear();
  }

  void _showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        duration: const Duration(milliseconds: 2200),
        content: Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 8,
          children: [
            Text(
              'Thanks for contacting me. '
              'I\'ll get back to you as soon as possible!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.background,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(FontAwesomeIcons.faceSmile)
          ],
        ),
      ),
    );
  }

  void _showErrorSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Theme.of(context).colorScheme.error,
        content: Text(
          'Yoinks, there was a problem. Please try again.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.background,
          ),
        ),
      ),
    );
  }
}
