// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';
import 'package:muse/presentation/main_app_navigator.dart';
import 'package:muse/presentation/street_pass_screen/street_pass_screen.dart';

class AppRoutes {
  static const String streetPassScreen = '/street_pass_screen';

  static const String homePage = '/home_page';

  static const String postPage = '/post_page';

  static const String profilePage = '/profile_page';

  static const String chatPage = '/chat_page';

  static const String activityPage = '/activity_page';

  static const String initialRoute = '/initialRoute';

  static const String root = '/';

  static Map<String, WidgetBuilder> routes = {
    root:(context) => const MainAppNavigator(),
    initialRoute: (context) => const MainAppNavigator(),
    homePage: (context) => const MainAppNavigator(),
    profilePage: (context) => const MainAppNavigator(),
    // chatPage: (context) => const ChatPage(),
    // activityPage: (context) => const ActivityPage(),
    streetPassScreen: (context) => const StreetPassScreen(),
  };
}
