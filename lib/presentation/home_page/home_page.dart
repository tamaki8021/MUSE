// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/core/app_export.dart';
import 'package:muse/presentation/home_page/widgets/player.dart';
import 'package:muse/presentation/home_page/widgets/row_user_list.dart';
import 'package:muse/presentation/home_page/widgets/user_info.dart';
import 'package:muse/widgets/bottom_bar/custom_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: _buildAppBar(context),
        body: _buildBody(context),
        bottomNavigationBar: const CustomBottomBar(),
      ),
    );
  }

  Container _buildBody(BuildContext context) {
    final appBarHeight = _buildAppBar(context).preferredSize.height;

    return Container(
      width: SizeUtils.width,
      height: SizeUtils.height,
      padding: EdgeInsets.only(top: appBarHeight + 1.5.h),
      decoration: AppDecoration.gradientBackground,
      child: Column(
        children: [
          /// 音楽再生者の情報を表示するコンポーネント
          const UserInfo(),
          SizedBox(height: 6.h),

          /// 現在再生中の音楽情報を表示するコンポーネント
          const Player(),

          /// 音楽再生可能なユーザーのリストを表示するコンポーネント
          const RowUserList(),
        ],
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: 'lbl_muse'.tr,
      ),
      actions: const [
        CustomGradientMask(
          child: IconButton(
            onPressed: null,
            icon: Icon(
              AppIcons.menu,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
