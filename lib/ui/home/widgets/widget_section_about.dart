import 'package:flutter/material.dart';

class SingleImageSectionWidget extends StatefulWidget {
  final double height;
  final String title;
  final String image;
  final Color backgroundColor;

  /// Si toda la sección funciona como botón
  final bool isButton;
  final VoidCallback? onTap;

  const SingleImageSectionWidget({
    super.key,
    this.height = 800,
    required this.title,
    required this.image,
    this.backgroundColor = Colors.white,
    this.isButton = false,
    this.onTap,
  });

  @override
  State<SingleImageSectionWidget> createState() => _SingleImageSectionWidgetState();
}

class _SingleImageSectionWidgetState extends State<SingleImageSectionWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool clickable = widget.isButton && widget.onTap != null;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: clickable ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: clickable ? widget.onTap : null,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: _isHovered && clickable ? 0.9 : 1.0,
          child: Container(
            height: widget.height,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 120),
            decoration: BoxDecoration(
              color: widget.backgroundColor,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 900;

                return isMobile
                    ? _buildMobileLayout()
                    : _buildDesktopLayout();
              },
            ),
          ),
        ),
      ),
    );
  }

  /// Desktop: imagen izquierda – texto derecha
  Widget _buildDesktopLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _image(),
        Expanded(
          child: Text(
            widget.title,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontFamily: 'Old London',
              fontSize: 70,
              color: Colors.black,
              letterSpacing: 2,
            ),
          ),
        ),
      ],
    );
  }

  /// Mobile layout: todo centrado
  Widget _buildMobileLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _image(),
        const SizedBox(height: 40),
        Text(
          widget.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Old London',
            fontSize: 50,
            color: Colors.black,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }

  /// Cuadro único de imagen
  Widget _image() {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(widget.image),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .25),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
    );
  }
}
