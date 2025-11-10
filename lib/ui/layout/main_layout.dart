import 'package:acehornweb/ui/widgets/floating_header.dart';
import 'package:acehornweb/ui/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const SideMenu(),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          widget.child,
          FloatingHeader(scaffoldKey: _scaffoldKey),
        ],
      ),
    );
  }
}
