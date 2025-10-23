import 'package:acehornweb/ui/about_section.dart';
import 'package:acehornweb/ui/contact_section.dart';
import 'package:acehornweb/ui/home_page.dart';
import 'package:acehornweb/ui/music_section.dart';
import 'package:acehornweb/ui/tour_section.dart';
import 'package:fluro/fluro.dart';

class AppRouter {
  static final FluroRouter router = FluroRouter();

  static final Handler _homeHandler =
      Handler(handlerFunc: (context, params) => const HomePage());
  static final Handler _aboutHandler =
      Handler(handlerFunc: (context, params) => const AboutSection());
  static final Handler _musicHandler =
      Handler(handlerFunc: (context, params) => const MusicSection());
  static final Handler _tourHandler =
      Handler(handlerFunc: (context, params) => const TourSection());
  static final Handler _contactHandler =
      Handler(handlerFunc: (context, params) => const ContactSection());

  static void setupRouter() {
    router.define('/', handler: _homeHandler,);
    router.define('/about', handler: _aboutHandler);
    router.define('/music', handler: _musicHandler);
    router.define('/tour', handler: _tourHandler);
    router.define('/contact', handler: _contactHandler);
  }
}
