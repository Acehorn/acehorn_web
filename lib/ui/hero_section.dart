import 'package:acehornweb/theme/colors.dart';
import 'package:acehornweb/ui/widgets/page_template.dart';
import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(title: 'Hero', color: AppColors.gradientStart,);
  }
}