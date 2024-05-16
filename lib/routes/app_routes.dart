// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';
import 'package:muse/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:muse/presentation/home_page/home_page.dart';
import 'package:muse/presentation/street_pass_screen/street_pass_screen.dart';

class AppRoutes {
  static const String streetPassScreen = '/street_pass_screen';

  static const String homePage = '/home_page';

  static const String profilePage = '/profile_page';

  static const String chatPage = '/chat_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    streetPassScreen: (context) => const StreetPassScreen(),
    appNavigationScreen: (context) => const AppNavigationScreen(),
    initialRoute: (context) => const HomePage(),
  };
}
