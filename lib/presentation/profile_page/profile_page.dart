import 'package:flutter/material.dart';
import 'package:muse/core/app_export.dart';
import 'package:muse/widgets/app_bar/appbar_title.dart';
import 'package:muse/widgets/app_bar/appbar_trailing_image.dart';
import 'package:muse/widgets/app_bar/custom_app_bar.dart';
import 'package:muse/widgets/custom_icon_button.dart';

import '../profile_page/widgets/thirty_item_widget.dart';
import '../profile_page/widgets/userprofile1_item_widget.dart';
import 'models/thirty_item_model.dart';
import 'models/userprofile1_item_model.dart';
import 'notifier/profile_notifier.dart';

// ignore_for_file: must_be_immutable
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key})
      : super(
          key: key,
        );

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: _buildAppBar(context),
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const Alignment(-0.06, -0.2),
              end: const Alignment(1.37, 0.82),
              colors: [
                appTheme.purpleA200,
                appTheme.purple800,
                appTheme.black900,
              ],
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 3.h),
            child: Column(
              children: [
                SizedBox(height: 33.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 51.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 26.h,
                          bottom: 36.h,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'lbl_1_342'.tr,
                              style: TextStyle(
                                color: appTheme.whiteA700,
                                fontSize: 16.fSize,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Text(
                              'lbl_my_posts'.tr,
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
                      const Spacer(
                        flex: 52,
                      ),
                      SizedBox(
                        height: 108.h,
                        width: 96.h,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgEllipse3096x96,
                              height: 96.adaptSize,
                              width: 96.adaptSize,
                              radius: BorderRadius.circular(
                                48.h,
                              ),
                              alignment: Alignment.topCenter,
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgImage88x88,
                              height: 88.adaptSize,
                              width: 88.adaptSize,
                              radius: BorderRadius.circular(
                                44.h,
                              ),
                              alignment: Alignment.topCenter,
                              margin: EdgeInsets.only(top: 4.h),
                            ),
                            CustomIconButton(
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                              padding: EdgeInsets.all(4.h),
                              decoration: IconButtonStyleHelper.outlineWhiteA,
                              alignment: Alignment.bottomCenter,
                              child: CustomImageView(
                                imagePath: ImageConstant.imgCheckmark,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(
                        flex: 47,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 25.h,
                          bottom: 36.h,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'lbl_586'.tr,
                              style: TextStyle(
                                color: appTheme.whiteA700,
                                fontSize: 16.fSize,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              'lbl_favorites'.tr,
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
                  ),
                ),
                SizedBox(height: 9.h),
                Text(
                  'lbl_eleanor_mena'.tr,
                  style: TextStyle(
                    color: appTheme.whiteA700,
                    fontSize: 18.fSize,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'msg_sometimes_i_cook'.tr,
                  style: TextStyle(
                    color: appTheme.blueGray300,
                    fontSize: 14.fSize,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 30.h),
                _buildUserProfile(context),
                SizedBox(height: 17.h),
                _buildTabsTabBar(context),
                SizedBox(height: 17.h),
                _buildThirty(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: 'lbl_muse'.tr,
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgUser,
          margin: EdgeInsets.symmetric(
            horizontal: 24.h,
            vertical: 4.h,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 29.h,
        right: 33.h,
      ),
      child: Consumer(
        builder: (context, ref, _) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 17.h,
              );
            },
            itemCount: ref
                    .watch(profileNotifier)
                    .profileModelObj
                    ?.userprofile1ItemList
                    .length ??
                0,
            itemBuilder: (context, index) {
              final model = ref
                      .watch(profileNotifier)
                      .profileModelObj
                      ?.userprofile1ItemList[index] ??
                  Userprofile1ItemModel();
              return Userprofile1ItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildTabsTabBar(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.fromLTRB(74.h, 7.h, 74.h, 6.h),
      decoration: AppDecoration.outlineGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3.h),
            child: Text(
              'lbl_my_post'.tr,
              style: TextStyle(
                color: appTheme.yellow900,
                fontSize: 14.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(
            flex: 43,
          ),
          SizedBox(
            height: 24.h,
            child: VerticalDivider(
              width: 1.h,
              thickness: 1.h,
            ),
          ),
          const Spacer(
            flex: 56,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: Text(
              'lbl_favorite'.tr,
              style: TextStyle(
                color: appTheme.whiteA700,
                fontSize: 14.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildThirty(BuildContext context) {
    return SizedBox(
      height: 170.h,
      child: Consumer(
        builder: (context, ref, _) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 23.h,
              );
            },
            itemCount: ref
                    .watch(profileNotifier)
                    .profileModelObj
                    ?.thirtyItemList
                    .length ??
                0,
            itemBuilder: (context, index) {
              final model = ref
                      .watch(profileNotifier)
                      .profileModelObj
                      ?.thirtyItemList[index] ??
                  ThirtyItemModel();
              return ThirtyItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }
}
