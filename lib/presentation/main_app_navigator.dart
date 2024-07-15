// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/core/app_export.dart';
import 'package:muse/presentation/activity_page/activity_pade.dart';
import 'package:muse/presentation/chat_page/chat_page.dart';
import 'package:muse/presentation/home_page/home_page.dart';
import 'package:muse/presentation/profile_page/profile_page.dart';
import 'package:muse/widgets/bottom_bar/custom_bottom_bar.dart';

class MainAppNavigator extends StatelessWidget {
  const MainAppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: getCurrentPage(context, currentRoute!),
        bottomNavigationBar: const CustomBottomBar(),
      ),
    );
  }

  Widget getCurrentPage(BuildContext context, String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return const HomePage();
      case AppRoutes.chatPage:
        return const ChatPage();
      case AppRoutes.profilePage:
        return const ProfilePage();
      case AppRoutes.activityPage:
        return const ActivityPage();
      default:
        return const SizedBox.shrink();
    }
  }
}
