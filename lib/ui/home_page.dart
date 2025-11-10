import 'package:acehornweb/ui/layout/main_layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return MainLayout(
      
      child: SingleChildScrollView(
        controller: _scrollController,

        child: Column(
          children: [
         
            _section(height: 800, title: 'Home', color: Colors.black),
            _section(height: 800, title: 'About', color: Colors.deepPurple.shade800),
            _section(height: 800, title: 'Music', color: Colors.deepPurple.shade900),
            _section(height: 800, title: 'Tour', color: Colors.indigo.shade900),
            _section(height: 800, title: 'Contact', color: Colors.purple.shade700),
          ],
        ),
      ),
    );
  }

  Widget _section({
    required double height,
    required String title,
    required Color color,
  }) {
    return Container(
      height: height,
      width: double.infinity,
      color: color,
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(fontSize: 40, color: Colors.white),
      ),
    );
  }
}
