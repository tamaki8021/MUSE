// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:outline_gradient_button/outline_gradient_button.dart';

// Project imports:
import 'package:muse/core/app_export.dart';
import 'package:muse/presentation/activity_page/widgets/column_title_two.dart';

class FollowedItem extends StatelessWidget {
  const FollowedItem({
    Key? key,
    required this.name,
    required this.time,
    required this.imagePath,
    this.isFollowing = false,
  }) : super(key: key);

  final String name;
  final String time;
  final String? imagePath;
  final bool isFollowing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      decoration: AppDecoration.outlineBottomWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColumnTitleTwo(
            title: name,
            time: time,
            message: 'lbl_follow_message'.tr,
            imagePath: imagePath,
          ),
          SizedBox(
            height: 5.h,
            child: OutlineGradientButton(
              backgroundColor:
                  isFollowing ? Colors.transparent : appTheme.white,
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
            ),
          ),
        ],
      ),
    );
  }
}
