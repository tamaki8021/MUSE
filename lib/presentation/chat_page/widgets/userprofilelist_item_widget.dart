import '../models/userprofilelist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hibiki_tamaki_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class UserprofilelistItemWidget extends StatelessWidget {
  UserprofilelistItemWidget(
    this.userprofilelistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserprofilelistItemModel userprofilelistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(top: 4.v),
          child: Column(
            children: [
              SizedBox(
                height: 56.adaptSize,
                width: 56.adaptSize,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgEllipse3056x56,
                      height: 56.adaptSize,
                      width: 56.adaptSize,
                      radius: BorderRadius.circular(
                        28.h,
                      ),
                      alignment: Alignment.center,
                    ),
                    CustomImageView(
                      imagePath: userprofilelistItemModelObj?.userImage2,
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
              SizedBox(height: 7.v),
              Text(
                userprofilelistItemModelObj.userName!,
                style: TextStyle(
                  color: appTheme.whiteA700,
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
