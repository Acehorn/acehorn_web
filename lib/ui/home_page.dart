import 'package:acehornweb/router/router.dart';
import 'package:acehornweb/ui/layout/main_layout.dart';
import 'package:acehornweb/ui/widgets/widget_section.dart';
import 'package:acehornweb/ui/widgets/widget_section_about.dart';
import 'package:acehornweb/ui/widgets/widget_section_music.dart';
import 'package:fluro/fluro.dart';
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
         
           SectionWidget(title: 'Acehorn', backgroundImage: 'images/home_image.jpeg', isButton: false, color: Colors.black,),
           MusicSectionWidget(title: 'Music', album1: 'images/albums/bewitched.jpg', album2: 'images/albums/saviours.jpg', isButton: true,  onTap: () => _navigate(context, '/music'), backgroundColor: Colors.white,),
            SectionWidget(title: 'Contact', backgroundImage: 'images/contact_image.jpeg', isButton: true,  onTap: () => _navigate(context, '/contact'), color: Colors.black,),
            SingleImageSectionWidget(title: 'About Me', image: 'images/about_image.jpeg',  isButton: true,  onTap: () => _navigate(context, '/about'), backgroundColor: Colors.white,),
          ],
        ),
      ),
    );
  }


  void _navigate(BuildContext context, String route) {
    AppRouter.router.navigateTo(
      context,
      route,
      transition: TransitionType.fadeIn,
      replace: false,
    );
  }

}
