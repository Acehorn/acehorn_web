import 'package:acehornweb/theme/colors.dart';
import 'package:acehornweb/ui/widgets/page_template.dart';
import 'package:flutter/material.dart';

class MusicSection extends StatelessWidget {
  const MusicSection({super.key});

  @override
  Widget build(BuildContext context) {
   return PageTemplate(title: 'Music', color: AppColors.gradientEnd,);
  }
}