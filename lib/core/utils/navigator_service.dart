// ignore_for_file: avoid_classes_with_only_static_members

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/core/app_export.dart';

class NavigatorService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<dynamic> pushNamed(
    String routeName, {
    dynamic arguments,
  }) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> pushNamedNoAnimation(
    String routeName, {
    dynamic arguments,
  }) {
    return navigatorKey.currentState!.push(
      _noAnimationRoute(
        routeName,
        arguments: arguments,
      ),
    );
  }

  static Future<dynamic> pushNamedWithCustomAnimation(
    String routeName, {
    dynamic arguments,
  }) {
    return navigatorKey.currentState!.push(
      _customAnimationRoute(
        routeName,
        arguments: arguments,
      ),
    );
  }

  static void goBack() {
    return navigatorKey.currentState?.pop();
  }

  static Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    bool routePredicate = false,
    dynamic arguments,
  }) async {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (route) => routePredicate,
      arguments: arguments,
    );
  }

  static Future<dynamic> popAndPushNamed(
    String routeName, {
    dynamic arguments,
  }) async {
    return navigatorKey.currentState
        ?.popAndPushNamed(routeName, arguments: arguments);
  }

  static Route<dynamic> _noAnimationRoute(
    String routeName, {
    dynamic arguments,
  }) {
    return PageRouteBuilder(
      settings: RouteSettings(
        name: routeName,
        arguments: arguments,
      ), // ここでsettingsを設定
      pageBuilder: (context, animation, secondaryAnimation) {
        return AppRoutes.getMainPage(
          routeName,
          arguments: arguments,
        );
      },
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }

  static Route<dynamic> _customAnimationRoute(
    String routeName, {
    dynamic arguments,
  }) {
    return PageRouteBuilder(
      settings: RouteSettings(name: routeName, arguments: arguments),
      pageBuilder: (context, animation, secondaryAnimation) {
        // AppRoutes.routes[routeName]がWidgetBuilderを返すので、contextを渡してWidgetを取得する
        return AppRoutes.routes[routeName]!(context);
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1, 0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
