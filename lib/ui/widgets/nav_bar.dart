import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final ScrollController scrollController;
  const NavBar({super.key, required this.scrollController});

  void _scrollTo(double position) {
    scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundDark.withValues(alpha:0.9),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo o Nombre
          const Text(
            'ACEHORN',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),
          Row(
            children: [
              _NavButton('Home', () => _scrollTo(0)),
              _NavButton('About', () => _scrollTo(800)),
              _NavButton('Music', () => _scrollTo(1600)),
              _NavButton('Tour', () => _scrollTo(2400)),
              _NavButton('Contact', () => _scrollTo(3200)),
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _NavButton(this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            label.toUpperCase(),
            style: AppTextStyles.subtitle.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
