import 'package:flutter/material.dart';
import 'package:muse/core/app_export.dart';

import 'bottom_bar_item.dart';
import 'bottom_bar_model.dart';

enum BottomBarEnum {
  home,
  chat,
  activity,
  profile,
}

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomBarList = <BottomBarModel>[
      BottomBarModel(icon: AppIcons.home, type: BottomBarEnum.home),
      BottomBarModel(icon: Icons.forum_outlined, type: BottomBarEnum.chat),
      BottomBarModel(icon: AppIcons.bell, type: BottomBarEnum.activity),
      BottomBarModel(icon: AppIcons.personOutline, type: BottomBarEnum.profile),
    ];

    final currentRoute = ModalRoute.of(context)!.settings.name ?? '';

    return BottomAppBar(
      height: 7.8.h,
      padding: EdgeInsets.symmetric(vertical: 0.5.h),
      color: appTheme.gray90001,
      notchMargin: 0,
      elevation: 0,
      shape: const AutomaticNotchedShape(
        RoundedRectangleBorder(),
        StadiumBorder(
          side: BorderSide(),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            bottomBarList.length + 1,
            (index) {
              final bottomBar = bottomBarList[index < 2 ? index : index - 1];
              if (index == 2) {
                return const CustomFloatingButton();
              }
              return BottomBarItem(
                icon: bottomBar.icon,
                isSelected: getCurrentRoute(bottomBar.type) == currentRoute,
                onPressed: () {
                  NavigatorService.pushNamed(
                    getCurrentRoute(bottomBar.type),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.home:
        return AppRoutes.homePage;
      case BottomBarEnum.chat:
        return AppRoutes.chatPage;
      case BottomBarEnum.activity:
        return AppRoutes.activityPage;
      case BottomBarEnum.profile:
        return AppRoutes.profilePage;
    }
  }
}
