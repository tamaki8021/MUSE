// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/core/app_export.dart';
import 'package:muse/widgets/followed_button.dart';

class FriendPage extends StatelessWidget {
  const FriendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        height: SizeUtils.height,
        width: SizeUtils.width,
        decoration: AppDecoration.gradientBackground,
        child: ListView.builder(
          itemBuilder: (context, index) => friendItem(),
          itemCount: 20,
        ),
      ),
    );
  }

  Widget friendItem() {
    const imagePath = 'https://picsum.photos/250?image=9';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      decoration: AppDecoration.outlineBottomWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 5.5.adaptSize,
            backgroundImage: const NetworkImage(imagePath),
          ),
          SizedBox(width: 3.w),
          CustomText(
            text: 'name',
            style: CustomTextStyles.labelLargeInter.copyWith(
              fontSize: 5.fSize,
              color: appTheme.white,
            ),
          ),
          const Spacer(),
          const FollowedButton(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      title: AppbarTitle(
        text: 'lbl_friends'.tr,
      ),
      centerTitle: true,
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
