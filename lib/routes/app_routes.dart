import 'package:flutter/material.dart';
import 'package:hibiki_tamaki_s_application1/presentation/home_page/home_page.dart';
import 'package:hibiki_tamaki_s_application1/presentation/street_pass_screen/street_pass_screen.dart';
import 'package:hibiki_tamaki_s_application1/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String streetPassScreen = '/street_pass_screen';

  static const String homePage = '/home_page';

  static const String profilePage = '/profile_page';

  static const String chatPage = '/chat_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    streetPassScreen: (context) => StreetPassScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => HomePage(),
  };
}
