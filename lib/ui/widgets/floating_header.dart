import 'package:flutter/material.dart';

class FloatingHeader extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const FloatingHeader({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 10, // evita notch
      left: 16,
      right: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white, size: 30),
            onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
          ),
        ],
      ),
    );
  }
}
