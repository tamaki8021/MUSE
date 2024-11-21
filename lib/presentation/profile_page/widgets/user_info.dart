// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/core/app_export.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildLabelAndNumber('lbl_my_posts'.tr, 10),
              _buildProfileImage(),
              _buildLabelAndNumber('lbl_favorites'.tr, 4),
            ],
          ),
          SizedBox(height: 1.h),
          Text(
            'lbl_eleanor_mena'.tr,
            style: CustomTextStyles.bodySmallWhite.copyWith(
              fontSize: 5.fSize,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'msg_sometimes_i_cook'.tr,
            style: CustomTextStyles.bodySmallWhite.copyWith(
              fontSize: 4.fSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return SizedBox(
      height: 13.h,
      width: 14.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse3096x96,
            height: 10.h,
            width: 10.h,
            alignment: Alignment.center,
          ),
          CustomImageView(
            imagePath: ImageConstant.imageNotFound,
            height: 9.h,
            width: 9.h,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
          CustomIconButton(
            onTap: () => NavigatorService.pushNamed(AppRoutes.profileEditPage),
            alignment: Alignment.bottomCenter,
            height: 9.adaptSize,
            width: 9.adaptSize,
            padding: EdgeInsets.only(left: 1.5.adaptSize),
            decoration: AppDecoration.appGradient.copyWith(
              borderRadius: BorderRadius.circular(
                5.5.adaptSize,
              ),
            ),
            child: Icon(
              AppIcons.edit,
              color: Colors.white,
              size: 5.adaptSize,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabelAndNumber(String label, int number) {
    return Column(
      children: [
        CustomText(
          text: number.toString(),
          style: CustomTextStyles.bodySmallWhite.copyWith(
            fontSize: 4.55.fSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        CustomText(
          text: label,
          style: CustomTextStyles.bodySmallWhite.copyWith(
            fontSize: 4.fSize,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
