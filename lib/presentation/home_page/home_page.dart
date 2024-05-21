import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:muse/core/app_export.dart';
import 'package:muse/widgets/app_bar/appbar_title.dart';
import 'package:muse/widgets/app_bar/appbar_trailing_image.dart';
import 'package:muse/widgets/app_bar/custom_app_bar.dart';
import 'package:muse/widgets/custom_icon_button.dart';

import 'models/userprofile_item_model.dart';
import 'notifier/home_notifier.dart';
import 'widgets/userprofile_item_widget.dart';

// ignore_for_file: must_be_immutable
class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key})
      : super(
          key: key,
        );

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
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
            padding: EdgeInsets.symmetric(vertical: 21.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 500.h,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 249.h,
                          width: 239.h,
                          margin: EdgeInsets.only(top: 97.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 25.h,
                            vertical: 30.h,
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: fs.Svg(
                                ImageConstant.imgGroup11,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: CustomImageView(
                            imagePath: ImageConstant.img600x600bb32,
                            height: 188.adaptSize,
                            width: 188.adaptSize,
                            radius: BorderRadius.circular(
                              94.h,
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 95.h,
                            vertical: 1.h,
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                ImageConstant.imgGroup607,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 26.h),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.h,
                                  vertical: 8.h,
                                ),
                                decoration: AppDecoration.fillGray900.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder23,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomImageView(
                                      imagePath: ImageConstant.imgRectangle521,
                                      height: 42.h,
                                      width: 36.h,
                                      radius: BorderRadius.circular(
                                        18.h,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10.h,
                                        top: 8.h,
                                        bottom: 9.h,
                                      ),
                                      child: Text(
                                        'lbl_dianne'.tr,
                                        style: TextStyle(
                                          color: appTheme.whiteA700,
                                          fontSize: 12.fSize,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgGroup611,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize,
                                      margin: EdgeInsets.only(
                                        left: 20.h,
                                        top: 7.h,
                                        bottom: 7.h,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 311.h),
                              Padding(
                                padding: EdgeInsets.only(right: 2.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 37.h),
                                      child: Text(
                                        'lbl_0_42'.tr,
                                        style: TextStyle(
                                          color: appTheme.whiteA700,
                                          fontSize: 14.fSize,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 38.h,
                                      width: 105.h,
                                      margin: EdgeInsets.only(top: 20.h),
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Text(
                                              'lbl_stray_sheep'.tr,
                                              style: TextStyle(
                                                color: appTheme.whiteA700,
                                                fontSize: 16.fSize,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              'lbl_kenshi_yonezu'.tr,
                                              style: TextStyle(
                                                color: appTheme.gray500,
                                                fontSize: 12.fSize,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 37.h),
                                      child: Text(
                                        'lbl_4_37'.tr,
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
                              ),
                              SizedBox(height: 22.h),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              child: CustomIconButton(
                                height: 54.adaptSize,
                                width: 54.adaptSize,
                                padding: EdgeInsets.all(11.h),
                                decoration: IconButtonStyleHelper.fillGrayTL27,
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgHeart,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 13.h),
                              child: CustomIconButton(
                                height: 64.adaptSize,
                                width: 64.adaptSize,
                                padding: EdgeInsets.all(14.h),
                                decoration: IconButtonStyleHelper.fillWhiteA,
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgMenuAlt4,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 13.h,
                                top: 5.h,
                                bottom: 5.h,
                              ),
                              child: CustomIconButton(
                                height: 54.adaptSize,
                                width: 54.adaptSize,
                                padding: EdgeInsets.all(11.h),
                                decoration: IconButtonStyleHelper.fillGrayTL27,
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgChat,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 37.h),
                _buildUserProfile(context),
                SizedBox(height: 3.h),
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
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 107.h,
        child: Consumer(
          builder: (context, ref, _) {
            return ListView.separated(
              padding: EdgeInsets.only(left: 26.h),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  width: 12.h,
                );
              },
              itemCount: ref
                      .watch(homeNotifier)
                      .homeModelObj
                      ?.userprofileItemList
                      .length ??
                  0,
              itemBuilder: (context, index) {
                final model = ref
                        .watch(homeNotifier)
                        .homeModelObj
                        ?.userprofileItemList[index] ??
                    UserprofileItemModel();
                return UserprofileItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
