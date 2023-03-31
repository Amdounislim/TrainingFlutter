import 'package:get/get.dart';

import '../views/post_view.dart';
import '../views/home_view.dart';
import '../views/translation_view.dart';

class AppRoutes {
  static String home = '/home';
  static String translationPage = '/translationPage';
  static String posts = '/posts';

  static List<GetPage> pages = [
    GetPage(name: home, page: () => MyHomePage()),
    GetPage(name: translationPage, page: () => TranslationPage()),
    GetPage(name: posts, page: () => Posts())
  ];
}
