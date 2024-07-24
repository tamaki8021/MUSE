// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:outline_gradient_button/outline_gradient_button.dart';

// Project imports:
import 'package:muse/core/app_export.dart';
import 'package:muse/widgets/custom_input_image.dart';
import 'package:muse/widgets/custom_text_form_field.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      width: SizeUtils.width,
      height: SizeUtils.height,
      color: appTheme.black900,
      padding: EdgeInsets.only(top: 6.h),
      child: Column(
        children: [
          const Spacer(),
          CustomInputImage(
            radius: 18.adaptSize,
          ),
          SizedBox(height: 3.h),
          CustomTextFormField(
            contentPadding: const EdgeInsets.all(15),
            textStyle: CustomTextStyles.bodySmallWhite,
            labelText: 'lbl_name'.tr,
            hintText: 'hint_name'.tr,
            labelStyle: CustomTextStyles.labelSmallInter,
            hintStyle: CustomTextStyles.labelSmallInterGray500,
            validator: (value) {
              if (value!.isEmpty) {
                return 'validator_mes_name_is_empty'.tr;
              }
              return null;
            },
            borderDecoration: InputBorderStyle.outlinedBorderWhiteCircle10,
            fillColor: Colors.transparent,
          ),
          SizedBox(height: 2.h),
          CustomTextFormField(
            labelText: 'lbl_bio'.tr,
            labelStyle: CustomTextStyles.labelSmallInter,
            textStyle: CustomTextStyles.bodySmallWhite,
            hintText: 'hint_bio'.tr,
            hintStyle: CustomTextStyles.labelSmallInterGray500,
            contentPadding: const EdgeInsets.all(15),
            maxLines: 3,
            validator: (value) {
              if (value!.isEmpty) {
                return 'validator_mes_bio_is_empty'.tr;
              } else if (value.length > 200) {
                return 'validator_mes_bio_lenght'.tr;
              }
              return null;
            },
            borderDecoration: InputBorderStyle.outlinedBorderWhiteCircle10,
            fillColor: Colors.transparent,
          ),
          const Spacer(flex: 6),
          SizedBox(
            width: SizeUtils.width,
            height: 7.h,
            child: OutlineGradientButton(
              gradient: AppDecoration.appGradient.gradient!,
              strokeWidth: 1,
              radius: const Radius.circular(10),
              child: Center(
                child: CustomText(
                  text: 'lbl_done'.tr,
                  isGradient: true,
                  style: CustomTextStyles.bodySmallWhite
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: 'lbl_edit_profile'.tr,
      ),
      leadingWidth: 10,
      leading: const IconButton(
        icon: CustomGradientMask(
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        onPressed: NavigatorService.goBack,
      ),
    );
  }
}
