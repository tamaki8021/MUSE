// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/core/app_export.dart';
import '../chat_page/widgets/userprofilelist1_item_widget.dart';
import '../chat_page/widgets/userprofilelist_item_widget.dart';
import 'models/userprofilelist1_item_model.dart';
import 'models/userprofilelist_item_model.dart';
import 'notifier/chat_notifier.dart';

// ignore_for_file: must_be_immutable
class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({Key? key})
      : super(
          key: key,
        );

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends ConsumerState<ChatPage> {
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
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUserProfileList(context),
                SizedBox(height: 5.h),
                Divider(
                  color: appTheme.white.withOpacity(0.5),
                  indent: 3.h,
                ),
                SizedBox(height: 14.h),
                _buildUserProfileList1(context),
                SizedBox(height: 14.h),
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
          imagePath: ImageConstant.imageNotFound,
          margin: EdgeInsets.symmetric(
            horizontal: 24.h,
            vertical: 4.h,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildUserProfileList(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 82.h,
        child: Consumer(
          builder: (context, ref, _) {
            return ListView.separated(
              padding: EdgeInsets.only(left: 14.h),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  width: 10.h,
                );
              },
              itemCount: ref
                      .watch(chatNotifier)
                      .chatModelObj
                      ?.userprofilelistItemList
                      .length ??
                  0,
              itemBuilder: (context, index) {
                final model = ref
                        .watch(chatNotifier)
                        .chatModelObj
                        ?.userprofilelistItemList[index] ??
                    UserprofilelistItemModel();
                return UserprofilelistItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfileList1(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 18.h,
        right: 212.h,
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
                height: 16.h,
              );
            },
            itemCount: ref
                    .watch(chatNotifier)
                    .chatModelObj
                    ?.userprofilelist1ItemList
                    .length ??
                0,
            itemBuilder: (context, index) {
              final model = ref
                      .watch(chatNotifier)
                      .chatModelObj
                      ?.userprofilelist1ItemList[index] ??
                  Userprofilelist1ItemModel();
              return Userprofilelist1ItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }
}
