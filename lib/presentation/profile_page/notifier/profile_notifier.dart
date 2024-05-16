import 'package:equatable/equatable.dart';
import 'package:muse/presentation/profile_page/models/profile_model.dart';

import '../models/thirty_item_model.dart';
import '../models/userprofile1_item_model.dart';
import '/core/app_export.dart';

part 'profile_state.dart';

final profileNotifier = StateNotifierProvider<ProfileNotifier, ProfileState>(
  (ref) => ProfileNotifier(
    ProfileState(
      profileModelObj: ProfileModel(
        userprofile1ItemList: [
          Userprofile1ItemModel(friends: 'Friends', allText: 'ALL'),
          Userprofile1ItemModel(friends: 'Street Pass', allText: 'ALL'),
        ],
        thirtyItemList: [
          ThirtyItemModel(xbb: ImageConstant.img600x600bb32170x170),
          ThirtyItemModel(xbb: ImageConstant.img600x600bb3),
        ],
      ),
    ),
  ),
);

/// A notifier that manages the state of a Profile according
/// to the event that is dispatched to it.
class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier(ProfileState state) : super(state);
}
