// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/core/app_export.dart';
import 'package:muse/presentation/activity_page/widgets/column_title_two.dart';
import 'package:muse/widgets/followed_button.dart';

// Package imports:


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
            width: 30.w,
            child: const FollowedButton(),
          ),
        ],
      ),
    );
  }
}
