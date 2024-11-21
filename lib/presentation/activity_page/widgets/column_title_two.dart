// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/core/app_export.dart';

class ColumnTitleTwo extends StatelessWidget {
  const ColumnTitleTwo({
    super.key,
    required this.title,
    required this.time,
    required this.message,
    this.iconData,
    this.imagePath,
  });

  final String title;
  final String time;
  final String message;
  final IconData? iconData;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            iconData == null
                ? const SizedBox.shrink()
                : Icon(
                    iconData,
                    color: appTheme.white,
                    size: 5.adaptSize,
                  ),

            /// TODO: imagepathがnullの場合に何も表示されなくなるので、UIが崩れる
            imagePath == null
                ? const SizedBox.shrink()
                : CircleAvatar(
                    radius: 2.5.adaptSize,
                    backgroundImage: NetworkImage(imagePath!),
                  ),
            SizedBox(width: 2.w),
            CustomText(
              text: title,
              style: CustomTextStyles.titleSmallSemiBold
                  .copyWith(fontSize: 5.fSize, fontWeight: FontWeight.w700),
            ),
            SizedBox(width: 2.w),
            CustomText(
              text: time,
              style: CustomTextStyles.labelSmallInterGray500.copyWith(
                color: appTheme.white.withOpacity(0.7),
                fontSize: 3.5.fSize,
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 7.w),
          child: CustomText(
            text: message,
            style: CustomTextStyles.bodySmallWhite,
          ),
        ),
      ],
    );
  }
}
