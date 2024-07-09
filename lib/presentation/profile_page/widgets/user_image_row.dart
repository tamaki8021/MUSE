import 'package:flutter/material.dart';
import 'package:muse/core/app_export.dart';

class UserImageRow extends StatelessWidget {
  const UserImageRow({
    Key? key,
    required this.label,
    this.userImagePaths,
  }) : super(key: key);

  final String label;
  final List<String>? userImagePaths;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
        decoration: AppDecoration.fillGray
            .copyWith(borderRadius: BorderRadius.circular(5.adaptSize)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: label,
                  style: CustomTextStyles.bodySmallWhite.copyWith(
                    fontSize: 4.fSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                CustomIconButton(
                  height: 3.5.h,
                  width: 7.6.h,
                  padding: EdgeInsets.symmetric(horizontal: 2.adaptSize),
                  decoration: AppDecoration.outlineWhite.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder10,
                  ),
                  child: Row(
                    children: [
                      CustomText(
                        text: 'lbl_all'.tr,
                        style: CustomTextStyles.bodySmallWhite.copyWith(
                          fontSize: 4.fSize,
                          color: appTheme.white,
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        size: 5.adaptSize,
                        color: appTheme.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              height: 9.h,
              child: Stack(
                children: List.generate(10, (index) {
                  return Positioned(
                    left: index * 40.0, // 画像を少し重ねる
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage(ImageConstant.imgEllipse2348x48),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
