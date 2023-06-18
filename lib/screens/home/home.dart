import 'package:flutter/material.dart';

import '../../widgets/footer.dart';
import '../screen.dart';
import 'about/about_section.dart';
import 'brands/brands_section.dart';
import 'contact/contact_section.dart';
import 'hero/hero_section.dart';
import 'projects/projects_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Screen(
      children: [
        HeroSection(),
        AboutSection(),
        ProjectsSection(),
        BrandsSection(),
        ContactSection(),
        Footer(),
      ],
    );
  }
}
