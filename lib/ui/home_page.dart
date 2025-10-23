import 'package:acehornweb/ui/widgets/side_menu.dart';
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
    return Scaffold(
      endDrawer: const SideMenu(),
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        title: const Text('Acehorn',    style: TextStyle(
              fontFamily: 'Old London',
              fontSize: 36,
              color: Colors.white,
              letterSpacing: 2,
            ),),
        centerTitle: false,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
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
