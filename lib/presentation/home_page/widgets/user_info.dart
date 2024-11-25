// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:muse/core/app_export.dart';
import 'package:muse/presentation/home_page/providers/home_provider.dart';

class UserInfo extends HookConsumerWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPostWithUser = ref.watch(currentPostWithUserProvider);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.8.h),
      decoration: AppDecoration.fillGray900.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder23,
      ),
      child: switch (asyncPostWithUser) {
        AsyncData(:final value) => value != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImageView(
                    imagePath: value.user.profileImageUrl.isNotEmpty
                        ? value.user.profileImageUrl
                        : ImageConstant.imageNotFound,
                    height: 10.adaptSize,
                    width: 10.adaptSize,
                    radius: BorderRadius.circular(14.h),
                    color: appTheme.white,
                    border: Border.all(color: appTheme.white, width: 0.2.h),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Text(
                      value.user.name,
                      style: theme.textTheme.labelMedium!
                          .copyWith(color: appTheme.white, fontSize: 4.fSize),
                    ),
                  ),
                  CustomIconButton(
                    height: 8.adaptSize,
                    width: 8.adaptSize,
                    child: Icon(
                      Icons.graphic_eq,
                      color: appTheme.brandColor,
                    ),
                  ),
                ],
              )
            : SizedBox(
                height: 10.adaptSize,
                child: const CircularProgressIndicator(),
              ),
        AsyncError(:final error) =>
          SizedBox(height: 10.adaptSize, child: Text('Error: $error')),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}
