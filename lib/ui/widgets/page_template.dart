import 'package:acehornweb/ui/layout/main_layout.dart';
import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  final String title;
  final Color color;

  const PageTemplate({super.key, required this.title, required this.color});


  @override
  Widget build(BuildContext context) {
    return MainLayout(
   
      child: Container(
        color: color,
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(fontSize: 40, color: Colors.white),
        ),
      ),
    );
  }
}