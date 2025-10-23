import 'package:acehornweb/theme/colors.dart';
import 'package:acehornweb/ui/widgets/page_template.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(title: 'about', color: AppColors.accent,);
  }
}