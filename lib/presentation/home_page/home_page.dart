// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/core/app_export.dart';
import 'package:muse/widgets/bottom_bar/custom_bottom_bar.dart';
import 'models/userprofile_item_model.dart';
import 'notifier/home_notifier.dart';
import 'widgets/circle_progress_bar_painter.dart';
import 'widgets/userprofile_item_widget.dart';

// ignore_for_file: must_be_immutable
class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key})
      : super(
          key: key,
        );

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          _buildUserInfo(),
          SizedBox(height: 6.h),
          _buildPlayer(context),
          _buildUserProfile(context),
        ],
      ),
    );
  }

  /// 音楽の再生に関する情報を表示するコンポーネント
  Widget _buildPlayer(BuildContext context) {
    return Column(
      children: [
        _buildSongCircleContainer(),
        _buildSongTitle(),
        _buildSongController(),
      ],
    );
  }

  /// 音楽の再生状態を表示する円形のコンテナ
  Widget _buildSongCircleContainer() {
    return CustomPaint(
      painter: CircleProgressBarPainter(progress: 0.8),
      isComplex: true,
      willChange: true,
      child: _buildSongCoverImg(),
    );
  }

  /// 音楽の停止、再生、お気に入り等を行うコントローラー
  Widget _buildSongController() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(
            height: 14.adaptSize,
            width: 14.adaptSize,
            padding: EdgeInsets.all(1.h),
            isBorderGradient: true,
            child: CustomGradientMask(
              child: Center(
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.white,
                  size: 7.adaptSize,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: CustomIconButton(
              height: 18.adaptSize,
              width: 18.adaptSize,
              decoration: IconButtonStyleHelper.fillWhiteA,
              child: Icon(
                Icons.pause,
                size: 5.h,
                color: appTheme.black900,
              ),
            ),
          ),
          CustomIconButton(
            height: 14.adaptSize,
            width: 14.adaptSize,
            padding: EdgeInsets.all(1.5.h),
            isBorderGradient: true,
            child: CustomGradientMask(
              child: CustomImageView(
                imagePath: ImageConstant.imgChat,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 音楽のタイトル、アーティスト名、再生時間を表示するコンポーネント
  Widget _buildSongTitle({
    // ignore: unused_element
    String? title,
    // ignore: unused_element
    String? artist,
    // ignore: unused_element
    String? totalSongTime,
    // ignore: unused_element
    String? currentSongTime,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'lbl_0_42'.tr,
              style: CustomTextStyles.bodySmallWhite.copyWith(
                fontSize: 4.fSize,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomText(
              text: 'lbl_4_37'.tr,
              style: CustomTextStyles.bodySmallWhite.copyWith(
                fontSize: 4.fSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        CustomText(
          text: 'lbl_stray_sheep'.tr,
          style: CustomTextStyles.bodySmallWhite.copyWith(
            fontSize: 5.fSize,
            fontWeight: FontWeight.w700,
          ),
        ),
        CustomText(
          text: 'lbl_kenshi_yonezu'.tr,
          style: CustomTextStyles.bodySmallGray500.copyWith(
            fontSize: 3.5.fSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  /// 音楽再生者の情報を表示するコンポーネント
  Widget _buildUserInfo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.8.h),
      decoration: AppDecoration.fillGray900.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder23,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imageNotFound,
            height: 10.adaptSize,
            width: 10.adaptSize,
            radius: BorderRadius.circular(14.h),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Text(
              'lbl_dianne'.tr,
              style: theme.textTheme.labelMedium!
                  .copyWith(color: appTheme.white, fontSize: 4.fSize),
            ),
          ),
          CustomIconButton(
            height: 8.adaptSize,
            width: 8.adaptSize,
            child: Icon(
              Icons.graphic_eq,
              color: appTheme.brandColor,
            ),
          ),
        ],
      ),
    );
  }

  /// 音楽のジャケット画像を表示するコンポーネント
  Widget _buildSongCoverImg() {
    return SizedBox(
      width: 78.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            builder: (BuildContext context, Widget? child) {
              return Transform.rotate(
                angle: _controller.value * 2.0 * pi,
                child: child,
              );
            },
            animation: _controller,
            child: CustomImageView(
              imagePath: ImageConstant.imgHomeBgMusicCover,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imageNotFound,
            height: 48.adaptSize,
            width: 48.adaptSize,
            radius: BorderRadius.circular(56.h),
            alignment: Alignment.center,
          ),
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
        // AppbarTrailingImage(
        //   imagePath: ImageConstant.imgUser,
        //   margin: EdgeInsets.symmetric(
        //     horizontal: 24.h,
        //     vertical: 4.h,
        //   ),
        // ),
      ],
    );
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: SizedBox(
        height: 14.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return SizedBox(width: 2.w);
          },
          itemCount: ref
                  .watch(homeNotifier)
                  .homeModelObj
                  ?.userprofileItemList
                  .length ??
              0,
          itemBuilder: (context, index) {
            final model = ref
                    .watch(homeNotifier)
                    .homeModelObj
                    ?.userprofileItemList[index] ??
                UserprofileItemModel();
            return UserprofileItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }
}
