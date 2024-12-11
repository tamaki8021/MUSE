// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:muse/core/app_export.dart';
import 'package:muse/presentation/home_page/providers/home_provider.dart';
import 'package:muse/presentation/home_page/widgets/circle_progress_bar_painter.dart';

class Player extends HookConsumerWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPostWithUser = ref.watch(currentPostWithUserProvider);
    final animationController = useAnimationController(
      duration: const Duration(seconds: 1),
    )..repeat();

    return switch (asyncPostWithUser) {
      AsyncData(:final value) => value != null
          ? Column(
              children: [
                _buildSongCircleContainer(
                  animationController,
                  value.post.albumImageUrl,
                ),
                _buildSongTitle(
                  title: value.post.songName,
                  artist: value.post.artistsName,
                  totalSongTime: value.post.songDurationMs,
                ),
                _buildSongController(),
              ],
            )
          : const SizedBox.shrink(),
      AsyncError(:final error) => Text('Error: $error'),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }

  /// 音楽の再生状態を表示する円形のコンテナ
  Widget _buildSongCircleContainer(
    AnimationController controller,
    String albumImageUrl,
  ) {
    return CustomPaint(
      painter: CircleProgressBarPainter(progress: 0.8),
      isComplex: true,
      willChange: true,
      child: SizedBox(
        width: 78.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: controller.value * 2.0 * pi,
                  child: child,
                );
              },
              animation: controller,
              child: CustomImageView(
                imagePath: ImageConstant.imgHomeBgMusicCover,
              ),
            ),
            CustomImageView(
              imagePath: albumImageUrl.isNotEmpty
                  ? albumImageUrl
                  : ImageConstant.imageNotFound,
              height: 48.adaptSize,
              width: 48.adaptSize,
              radius: BorderRadius.circular(56.h),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
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
    required String title,
    required String artist,
    required String totalSongTime,
    // ignore: unused_element
    String? currentSongTime,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// current
            CustomText(
              text: 'lbl_0_42'.tr,
              style: CustomTextStyles.bodySmallWhite.copyWith(
                fontSize: 4.fSize,
                fontWeight: FontWeight.w500,
              ),
            ),

            /// total
            CustomText(
              text: totalSongTime,
              style: CustomTextStyles.bodySmallWhite.copyWith(
                fontSize: 4.fSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        CustomText(
          text: title,
          style: CustomTextStyles.bodySmallWhite.copyWith(
            fontSize: 5.fSize,
            fontWeight: FontWeight.w700,
          ),
        ),
        CustomText(
          text: artist,
          style: CustomTextStyles.bodySmallGray500.copyWith(
            fontSize: 3.5.fSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
