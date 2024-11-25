// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:muse/core/app_export.dart';
import 'package:muse/presentation/home_page/providers/home_provider.dart';

class RowUserList extends HookConsumerWidget {
  const RowUserList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPostWithUsers = ref.watch(homeNotifierProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: SizedBox(
        height: 14.h,
        child: asyncPostWithUsers.when(
          data: (postWithUsers) => ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 2.w);
            },
            itemCount: postWithUsers.length,
            itemBuilder: (context, index) {
              final postWithUser = postWithUsers[index];

              return GestureDetector(
                onTap: () => ref
                    .read(currentPostWithUserProvider.notifier)
                    .selected(postWithUser),
                child: userItem(
                  profileImageUrl: postWithUser.user.profileImageUrl,
                  name: postWithUser.user.name,
                ),
              );
            },
          ),
          error: (error, _) => Text('Error: $error'),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  Widget userItem({
    required String profileImageUrl,
    required String name,
  }) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.all(1.w),
        child: Column(
          children: [
            Container(
              height: 20.adaptSize,
              width: 20.adaptSize,
              padding: EdgeInsets.all(0.3.h),
              decoration: AppDecoration.gradientProfileImageBg.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder28,
              ),
              child: CustomImageView(
                imagePath: profileImageUrl.isNotEmpty
                    ? profileImageUrl
                    : ImageConstant.imageNotFound,
                radius: BorderRadius.circular(41.h),
                alignment: Alignment.center,
              ),
            ),
            SizedBox(height: 0.5.h),
            Text(
              name.isNotEmpty ? name : 'NO NAME',
              style: TextStyle(
                color: appTheme.white,
                fontSize: 3.5.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
