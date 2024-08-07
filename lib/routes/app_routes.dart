// ignore_for_file: avoid_classes_with_only_static_members

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/presentation/activity_page/activity_pade.dart';
import 'package:muse/presentation/chat_page/chat_page.dart';
import 'package:muse/presentation/friend_page/friend_page.dart';
import 'package:muse/presentation/home_page/home_page.dart';
import 'package:muse/presentation/post_music_page/post_music_page.dart';
import 'package:muse/presentation/profile_edit_page/profile_edit_pade.dart';
import 'package:muse/presentation/profile_page/profile_page.dart';
import 'package:muse/presentation/sign_in_page/sign_in_page.dart';
import 'package:muse/presentation/street_pass_screen/street_pass_screen.dart';

class AppRoutes {
  static const String root = '/';
  static const String initialRoute = '/initialRoute';
  static const String homePage = '/home_page';
  static const String postPage = '/post_page';
  static const String profilePage = '/profile_page';
  static const String chatPage = '/chat_page';
  static const String activityPage = '/activity_page';
  static const String profileEditPage = '/profile_edit_page';
  static const String friendsPage = '/friends_page';

  static const String streetPassScreen = '/street_pass_screen';

  static Map<String, WidgetBuilder> routes = {
    initialRoute: (context) => const SignInPage(),
    homePage: (context) => const HomePage(),
    profilePage: (context) => const ProfilePage(),
    activityPage: (context) => const ActivityPage(),
    profileEditPage: (context) => const ProfileEditPage(),
    // chatPage: (context) => const ChatPage(),
    postPage: (context) => const PostMusicPage(),
    friendsPage: (context) => const FriendPage(),
    streetPassScreen: (context) => const StreetPassScreen(),
  };

  static Widget getMainPage(String routeName, {dynamic arguments}) {
    switch (routeName) {
      case homePage:
        return const HomePage();
      case chatPage:
        return const ChatPage();
      case profilePage:
        return const ProfilePage();
      case activityPage:
        return const ActivityPage();
      default:
        return const HomePage();
    }
  }
}
