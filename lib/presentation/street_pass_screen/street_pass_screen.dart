import '../street_pass_screen/widgets/userprofilegrid_item_widget.dart';
import 'models/userprofilegrid_item_model.dart';
import 'notifier/street_pass_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hibiki_tamaki_s_application1/core/app_export.dart';

class StreetPassScreen extends ConsumerStatefulWidget {
  const StreetPassScreen({Key? key})
      : super(
          key: key,
        );

  @override
  StreetPassScreenState createState() => StreetPassScreenState();
}

class StreetPassScreenState extends ConsumerState<StreetPassScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.06, -0.2),
              end: Alignment(1.37, 0.82),
              colors: [
                appTheme.purpleA200,
                appTheme.purple800,
                appTheme.black900,
              ],
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 12.h,
              vertical: 4.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgArrowDown,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 103.h),
                        child: Text(
                          "lbl_street_pass".tr,
                          style: TextStyle(
                            color: appTheme.gray90002,
                            fontSize: 16.fSize,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 28.v),
                _buildUserProfileGrid(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfileGrid(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 245.v,
            crossAxisCount: 2,
            mainAxisSpacing: 13.h,
            crossAxisSpacing: 13.h,
          ),
          physics: NeverScrollableScrollPhysics(),
          itemCount: ref
                  .watch(streetPassNotifier)
                  .streetPassModelObj
                  ?.userprofilegridItemList
                  .length ??
              0,
          itemBuilder: (context, index) {
            UserprofilegridItemModel model = ref
                    .watch(streetPassNotifier)
                    .streetPassModelObj
                    ?.userprofilegridItemList[index] ??
                UserprofilegridItemModel();
            return UserprofilegridItemWidget(
              model,
            );
          },
        );
      },
    );
  }
}
