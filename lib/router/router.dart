import 'package:acehornweb/router/not_found_page.dart';
import 'package:acehornweb/ui/about/about_section.dart';
import 'package:acehornweb/ui/contact/contact_section.dart';
import 'package:acehornweb/ui/home/home_page.dart';
import 'package:acehornweb/ui/music/music_section.dart';
import 'package:fluro/fluro.dart';

class AppRouter {
  static final FluroRouter router = FluroRouter();

  static final Handler _homeHandler =
      Handler(handlerFunc: (context, params) => const HomePage());
  static final Handler _aboutHandler =
      Handler(handlerFunc: (context, params) => const AboutSection());
  static final Handler _musicHandler =
      Handler(handlerFunc: (context, params) => const MusicSection());
  static final Handler _contactHandler =
      Handler(handlerFunc: (context, params) => const ContactSection());

  static final Handler _notFoundHandler =
      Handler(handlerFunc: (context, params) => const NotFoundPage());

  static void setupRouter() {
    router.notFoundHandler = _notFoundHandler;

    router.define('/', handler: _homeHandler);
    router.define('/about', handler: _aboutHandler);
    router.define('/music', handler: _musicHandler);
    router.define('/contact', handler: _contactHandler);
  }
}
