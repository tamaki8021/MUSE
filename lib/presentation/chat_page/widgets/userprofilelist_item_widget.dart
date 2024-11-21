// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/core/app_export.dart';
import '../models/userprofilelist_item_model.dart';

// ignore: must_be_immutable
class UserprofilelistItemWidget extends StatelessWidget {
  UserprofilelistItemWidget(
    this.userprofilelistItemModelObj, {
    super.key,
  });

  UserprofilelistItemModel userprofilelistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: Column(
            children: [
              SizedBox(
                height: 56.adaptSize,
                width: 56.adaptSize,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imageNotFound,
                      height: 56.adaptSize,
                      width: 56.adaptSize,
                      radius: BorderRadius.circular(
                        28.h,
                      ),
                      alignment: Alignment.center,
                    ),
                    CustomImageView(
                      imagePath: userprofilelistItemModelObj.userImage2,
                      height: 48.adaptSize,
                      width: 48.adaptSize,
                      radius: BorderRadius.circular(
                        24.h,
                      ),
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 7.h),
              Text(
                userprofilelistItemModelObj.userName!,
                style: TextStyle(
                  color: appTheme.white,
                  fontSize: 12.fSize,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
