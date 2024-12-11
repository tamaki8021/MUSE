// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:muse/core/app_export.dart';
import 'package:muse/data/repositories/auth_repository.dart';
import 'package:muse/widgets/bottom_bar/custom_bottom_bar.dart';
import 'package:muse/widgets/custom_tab_bar.dart';
import 'widgets/music_cover_grid_view.dart';
import 'widgets/profile_info.dart';
import 'widgets/user_image_row.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        key: NavigatorService.scaffoldKey,
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: _buildAppBar(context),
        endDrawer: _buildDrawer(context, ref),
        bottomNavigationBar: const CustomBottomBar(),
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: AppDecoration.gradientBackground,
          padding: EdgeInsets.only(top: 6.h),
          child: DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  _buildHeaderSection(),
                  _buildTabBar(),
                ];
              },
              body: const TabBarView(
                children: [
                  MusicCoverGridView(),
                  MusicCoverGridView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const ProfileInfo(),
          UserImageRow(label: 'lbl_friends'.tr),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _StickyTabBarDelegate(
        tabBar: CustomTabBar(
          leftLabel: 'lbl_post'.tr,
          rightLabel: 'lbl_favorite'.tr,
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: 'lbl_profile'.tr,
      ),
      actions: const [
        CustomGradientMask(
          child: IconButton(
            onPressed: NavigatorService.openEndDrawer,
            icon: Icon(
              AppIcons.menu,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDrawer(BuildContext context, WidgetRef ref) {
    return CustomGradientMask(
      gradient: AppDecoration.gradientBackground.gradient,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text(
                'lbl_logout'.tr,
              ),
              onTap: () async {
                await ref.read(authRepositoryProvider).signOut();
                unawaited(NavigatorService.closeEndDrawer());
                await NavigatorService.pushReplacementNamedNoAnimation(
                  AppRoutes.signInPage,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// タブバーをヘッダーに配置するためのカスタムデリゲート
class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  const _StickyTabBarDelegate({required this.tabBar});

  final PreferredSizeWidget tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return tabBar;
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
