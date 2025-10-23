import 'package:acehornweb/theme/colors.dart';
import 'package:acehornweb/ui/widgets/page_template.dart';
import 'package:flutter/material.dart';

class TourSection extends StatelessWidget {
  const TourSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(title: 'Tour', color: AppColors.gradientStart,);
  }
}