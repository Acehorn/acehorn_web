import 'package:flutter/material.dart';

class MusicSectionWidget extends StatefulWidget {
  final double height;
  final String title;
  final Color backgroundColor;

  /// Rutas de imágenes de los dos álbumes
  final String album1;
  final String album2;

  /// Si toda la sección funciona como botón
  final bool isButton;
  final VoidCallback? onTap;

  const MusicSectionWidget({
    super.key,
    this.height = 800,
    required this.title,
    required this.album1,
    required this.album2,
    this.backgroundColor = Colors.white,
    this.isButton = false,
    this.onTap,
  });

  @override
  State<MusicSectionWidget> createState() => _MusicSectionWidgetState();
}

class _MusicSectionWidgetState extends State<MusicSectionWidget> {
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

  /// Desktop layout: Álbumes izquierda – Título derecha
  Widget _buildDesktopLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _albums(),
        Text(
          widget.title,
          style: const TextStyle(
            fontFamily: 'Old London',
            fontSize: 70,
            color: Colors.black,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }

  /// Mobile layout: Todo centrado y apilado
  Widget _buildMobileLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _albums(),
        const SizedBox(height: 40),
        Text(
          widget.title,
          style: const TextStyle(
            fontFamily: 'Old London',
            fontSize: 50,
            color: Colors.black,
            letterSpacing: 2,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  /// Muestra los dos álbumes estilo Spotify
Widget _albums() {
  final isMobile = MediaQuery.of(context).size.width < 900;

  if (isMobile) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _albumCover(widget.album1, size: 180),
        const SizedBox(height: 20),
        _albumCover(widget.album2, size: 180),
      ],
    );
  }

  // Desktop layout
  return Row(
    children: [
      _albumCover(widget.album1),
      const SizedBox(width: 30),
      _albumCover(widget.album2),
    ],
  );
}


  /// Cuadro individual de álbum
Widget _albumCover(String assetPath, {double size = 250}) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      image: DecorationImage(
        image: AssetImage(assetPath),
        fit: BoxFit.cover,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.25),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    ),
  );
}

}
