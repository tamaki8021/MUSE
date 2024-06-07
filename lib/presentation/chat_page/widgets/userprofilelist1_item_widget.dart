import 'package:flutter/material.dart';
import 'package:muse/core/app_export.dart';

import '../models/userprofilelist1_item_model.dart';

// ignore: must_be_immutable
class Userprofilelist1ItemWidget extends StatelessWidget {
  Userprofilelist1ItemWidget(
    this.userprofilelist1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Userprofilelist1ItemModel userprofilelist1ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomImageView(
          imagePath: userprofilelist1ItemModelObj.userImage,
          height: 48.adaptSize,
          width: 48.adaptSize,
          radius: BorderRadius.circular(
            24.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 12.h,
            top: 4.h,
            bottom: 3.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userprofilelist1ItemModelObj.userName!,
                style: TextStyle(
                  color: appTheme.white,
                  fontSize: 12.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                userprofilelist1ItemModelObj.timeAgo!,
                style: TextStyle(
                  color: appTheme.blueGray300,
                  fontSize: 12.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
