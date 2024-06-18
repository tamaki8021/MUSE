import 'package:flutter/material.dart';
import 'package:muse/core/app_export.dart';

import '../models/userprofile1_item_model.dart';

// ignore: must_be_immutable
class Userprofile1ItemWidget extends StatelessWidget {
  Userprofile1ItemWidget(
    this.userprofile1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Userprofile1ItemModel userprofile1ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 3.h,
        vertical: 5.h,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 7.h,
              right: 5.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  userprofile1ItemModelObj.friends!,
                  style: TextStyle(
                    color: appTheme.white,
                    fontSize: 14.fSize,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 19.h,
                  width: 45.h,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgTelevision,
                        height: 19.h,
                        width: 45.h,
                        radius: BorderRadius.circular(
                          9.h,
                        ),
                        alignment: Alignment.center,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                userprofile1ItemModelObj.allText!,
                                style: TextStyle(
                                  color: appTheme.white,
                                  fontSize: 10.fSize,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgArrowRight,
                                height: 14.h,
                                width: 6.h,
                                margin: EdgeInsets.only(left: 5.h),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            height: 48.h,
            width: 316.h,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgGlobe,
                  height: 48.adaptSize,
                  width: 48.adaptSize,
                  radius: BorderRadius.circular(
                    24.h,
                  ),
                  alignment: Alignment.centerLeft,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgThumbsUp,
                  height: 48.adaptSize,
                  width: 48.adaptSize,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 28.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgGlobe,
                  height: 48.adaptSize,
                  width: 48.adaptSize,
                  radius: BorderRadius.circular(
                    24.h,
                  ),
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 60.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgThumbsUp,
                  height: 48.adaptSize,
                  width: 48.adaptSize,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 88.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgRectangle5248x48,
                  height: 48.adaptSize,
                  width: 48.adaptSize,
                  radius: BorderRadius.circular(
                    24.h,
                  ),
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 116.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgEllipse2348x48,
                  height: 48.adaptSize,
                  width: 48.adaptSize,
                  radius: BorderRadius.circular(
                    24.h,
                  ),
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 120.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgRectangle23,
                  height: 48.adaptSize,
                  width: 48.adaptSize,
                  radius: BorderRadius.circular(
                    24.h,
                  ),
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 92.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgPlay,
                  height: 48.adaptSize,
                  width: 48.adaptSize,
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 60.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgPlay,
                  height: 48.adaptSize,
                  width: 48.adaptSize,
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 32.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgPlay,
                  height: 48.adaptSize,
                  width: 48.adaptSize,
                  alignment: Alignment.centerRight,
                ),
              ],
            ),
          ),
          SizedBox(height: 6.h),
        ],
      ),
    );
  }
}
