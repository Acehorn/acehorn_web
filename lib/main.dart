import 'package:flutter/material.dart';
import 'theme/colors.dart';
import 'ui/widgets/nav_bar.dart';

void main() {
  runApp(const AcehornApp());
}

class AcehornApp extends StatelessWidget {
  const AcehornApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ACEHORN | EDM Artist',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: AppColors.backgroundDark,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.accent),
      ),
      home: const HomePage(),
    );
  }
}

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
      appBar: NavBar(scrollController: _scrollController),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _section(
              height: 800,
              title: 'Home',
              color: AppColors.gradientStart,
            ),
            _section(
              height: 800,
              title: 'About',
              color: AppColors.gradientEnd,
            ),
            _section(
              height: 800,
              title: 'Music',
              color: Colors.black,
            ),
            _section(
              height: 800,
              title: 'Tour',
              color: Colors.deepPurple.shade900,
            ),
            _section(
              height: 800,
              title: 'Contact',
              color: Colors.deepPurple.shade700,
            ),
          ],
        ),
      ),
    );
  }

  Widget _section({required double height, required String title, Color? color}) {
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
