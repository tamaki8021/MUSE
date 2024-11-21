// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:muse/core/app_export.dart';
import 'package:muse/presentation/activity_page/widgets/custom_chip.dart';
import 'package:muse/presentation/activity_page/widgets/followed_item.dart';
import 'package:muse/presentation/activity_page/widgets/notification_item.dart';
import 'package:muse/widgets/bottom_bar/custom_bottom_bar.dart';

class ActivityPage extends HookConsumerWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: _buildAppBar(context),
        body: _buildBody(context),
        bottomNavigationBar: const CustomBottomBar(),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final isSelected = useState(false);

    return Container(
      width: SizeUtils.width,
      height: SizeUtils.height,
      decoration: AppDecoration.gradientBackground,
      padding: EdgeInsets.only(top: 6.h),
      child: Column(
        children: [
          _buildFilterChips(isSelected),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return _buildActivityItem(index);
                    },
                    childCount: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(int index) {
    /// TODO: リスト内のそれぞれのアイテムのタイプによって、ActivityItemTypeを使ってswitch文で返すWidgetを変える
    switch (index) {
      case 1:
        return const FollowedItem(
          name: 'name',
          time: '1h',
          imagePath: null,
        );
      default:
        return const NotificationItem();
    }
  }

  Widget _buildFilterChips(ValueNotifier<bool> isSelected) {
    return Container(
      padding: EdgeInsets.only(left: 2.w),
      height: 8.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CustomChip(
            iconData: Icons.person_add_alt,
            label: 'lbl_follows'.tr,
            isSelected: isSelected.value,
            onSelected: (bool value) {
              isSelected.value = !isSelected.value;
            },
          ),
          SizedBox(width: 4.w),
          CustomChip(
            iconData: AppIcons.music,
            label: 'lbl_music'.tr,
            isSelected: isSelected.value,
            onSelected: (bool value) {
              isSelected.value = !isSelected.value;
            },
          ),
          SizedBox(width: 4.w),
          CustomChip(
            iconData: AppIcons.bell,
            label: 'lbl_notifications'.tr,
            isSelected: isSelected.value,
            onSelected: (bool value) {
              isSelected.value = !isSelected.value;
            },
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: 'lbl_activity'.tr,
      ),
      actions: const [
        CustomGradientMask(
          child: IconButton(
            onPressed: null,
            icon: Icon(
              AppIcons.menu,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
