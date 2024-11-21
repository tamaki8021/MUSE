// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/core/app_export.dart';
import '../models/userprofile_item_model.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget(this.userprofileItemModelObj, {super.key});

  UserprofileItemModel userprofileItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.all(1.w),
        child: Column(
          children: [
            Container(
              height: 20.adaptSize,
              width: 20.adaptSize,
              padding: EdgeInsets.all(0.3.h),
              decoration: AppDecoration.gradientProfileImageBg.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder28,
              ),
              child: CustomImageView(
                imagePath: userprofileItemModelObj.userImage,
                radius: BorderRadius.circular(41.h),
                alignment: Alignment.center,
              ),
            ),
            SizedBox(height: 0.5.h),
            Text(
              userprofileItemModelObj.userName!,
              style: TextStyle(
                color: appTheme.white,
                fontSize: 3.5.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
