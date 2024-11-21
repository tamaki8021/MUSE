// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:outline_gradient_button/outline_gradient_button.dart';

// Project imports:
import 'package:muse/core/app_export.dart';

class FollowedButton extends StatelessWidget {
  const FollowedButton({
    super.key,
    this.isFollowing = false,
  });

  final bool isFollowing;

  @override
  Widget build(BuildContext context) {
    return OutlineGradientButton(
      backgroundColor: isFollowing ? Colors.transparent : appTheme.white,
      gradient: AppDecoration.appGradient.gradient!,
      strokeWidth: 2,
      radius: const Radius.circular(20),
      child: Center(
        child: CustomText(
          text: isFollowing ? 'lbl_following'.tr : 'lbl_follow_back'.tr,
          isGradient: true,
          style: CustomTextStyles.bodySmallWhite.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 3.5.fSize,
          ),
        ),
      ),
    );
  }
}
