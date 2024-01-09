import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/userprofile_item_model.dart';
import 'package:hibiki_tamaki_s_application1/presentation/home_page/models/home_model.dart';
part 'home_state.dart';

final homeNotifier = StateNotifierProvider<HomeNotifier, HomeState>(
  (ref) => HomeNotifier(HomeState(
    homeModelObj: HomeModel(userprofileItemList: [
      UserprofileItemModel(
          userImage: ImageConstant.imgRectangle20, userName: "Eleanor"),
      UserprofileItemModel(
          userImage: ImageConstant.imgImage, userName: "Edwords"),
      UserprofileItemModel(userName: "Pena"),
      UserprofileItemModel(userName: "Henry")
    ]),
  )),
);

/// A notifier that manages the state of a Home according to the event that is dispatched to it.
class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier(HomeState state) : super(state) {}
}
