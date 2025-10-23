import 'package:acehornweb/theme/colors.dart';
import 'package:acehornweb/ui/widgets/page_template.dart';
import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(title: 'Contact', color: AppColors.gradientEnd,);
  }
}