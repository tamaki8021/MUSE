// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/core/app_export.dart';
import 'package:muse/presentation/activity_page/widgets/column_title_two.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineBottomWhite,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: const ColumnTitleTwo(
        title: 'title',
        time: '2w',
        message: 'ho',
        iconData: AppIcons.bell,
      ),
    );
  }
}
