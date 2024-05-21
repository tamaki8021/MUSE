import 'package:flutter/material.dart';
import 'package:muse/core/app_export.dart';
import 'package:muse/widgets/custom_icon_button.dart';

import '../models/userprofilegrid_item_model.dart';

// ignore: must_be_immutable
class UserprofilegridItemWidget extends StatelessWidget {
  UserprofilegridItemWidget(
    this.userprofilegridItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserprofilegridItemModel userprofilegridItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 3.h,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                CustomImageView(
                  imagePath: userprofilegridItemModelObj.userImage,
                  height: 36.adaptSize,
                  width: 36.adaptSize,
                  radius: BorderRadius.circular(
                    18.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 11.h,
                    top: 7.h,
                    bottom: 7.h,
                  ),
                  child: Text(
                    userprofilegridItemModelObj.userName!,
                    style: TextStyle(
                      color: appTheme.whiteA700,
                      fontSize: 14.fSize,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 28.h,
                    top: 6.h,
                    bottom: 5.h,
                  ),
                  child: CustomIconButton(
                    height: 24.h,
                    width: 26.h,
                    padding: EdgeInsets.all(5.h),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgArrowDownWhiteA700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 9.h),
          CustomImageView(
            imagePath: userprofilegridItemModelObj.idolImage,
            height: 140.adaptSize,
            width: 140.adaptSize,
            radius: BorderRadius.circular(
              10.h,
            ),
          ),
          SizedBox(height: 9.h),
          Text(
            userprofilegridItemModelObj.idolText!,
            style: TextStyle(
              color: appTheme.whiteA700,
              fontSize: 16.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            userprofilegridItemModelObj.yoasobiText!,
            style: TextStyle(
              color: appTheme.gray500,
              fontSize: 12.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
