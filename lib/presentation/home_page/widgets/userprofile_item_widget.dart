import '../models/userprofile_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hibiki_tamaki_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget(
    this.userprofileItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserprofileItemModel userprofileItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 86.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(bottom: 1.v),
          child: Column(
            children: [
              Container(
                height: 86.adaptSize,
                width: 86.adaptSize,
                padding: EdgeInsets.all(1.h),
                decoration:
                    AppDecoration.gradientDeepOrangeToDeepPurpleA.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder43,
                ),
                child: CustomImageView(
                  imagePath: userprofileItemModelObj?.userImage,
                  height: 83.adaptSize,
                  width: 83.adaptSize,
                  radius: BorderRadius.circular(
                    41.h,
                  ),
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(height: 1.v),
              Text(
                userprofileItemModelObj.userName!,
                style: TextStyle(
                  color: appTheme.whiteA700,
                  fontSize: 12.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
