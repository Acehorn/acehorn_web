import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../../../router/router.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  void _navigate(BuildContext context, String route) {
    Navigator.pop(context); // Cierra el drawer si está abierto
    AppRouter.router.navigateTo(
      context,
      route,
      transition: TransitionType.fadeIn,
      replace: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.accent.withValues(alpha: 0.95),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        children: [
          const Text(
            'Acehorn',
            style: TextStyle(
              fontFamily: 'Old London',
              fontSize: 36,
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 40),
          _menuItem(context, 'Home', '/'),
          _menuItem(context, 'About', '/about'),
          _menuItem(context, 'Music', '/music'),
          _menuItem(context, 'Tour', '/tour'),
          _menuItem(context, 'Contact', '/contact'),
        ],
      ),
    );
  }

  Widget _menuItem(BuildContext context, String label, String route) {
    return ListTile(
      title: Text(
        label.toUpperCase(),
        style: AppTextStyles.subtitle.copyWith(color: Colors.white70),
      ),
      onTap: () => _navigate(context, route),
    );
  }
}
