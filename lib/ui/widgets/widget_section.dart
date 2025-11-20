import 'package:flutter/material.dart';

class SectionWidget extends StatefulWidget {
  final double height;
  final String title;
  final Color? color;
  final String? backgroundImage;

  final bool isButton;
  final VoidCallback? onTap;

  const SectionWidget({
    super.key,
     this.height = 800,
    required this.title,
    this.color,
    this.backgroundImage,
    this.isButton = false,
    this.onTap,
  });

  @override
  State<SectionWidget> createState() => _SectionWidgetState();
}

class _SectionWidgetState extends State<SectionWidget> {
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
          opacity: _isHovered && clickable ? 0.85 : 1.0,
          child: Container(
            height: widget.height,
            width: double.infinity,
            decoration: BoxDecoration(
              color: widget.color,
              image: widget.backgroundImage != null
                  ? DecorationImage(
                      image: AssetImage(widget.backgroundImage!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            alignment: Alignment.center,
            child: Text(
              widget.title,
              style: const TextStyle(
                fontFamily: 'Old London',
                fontSize: 60,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
