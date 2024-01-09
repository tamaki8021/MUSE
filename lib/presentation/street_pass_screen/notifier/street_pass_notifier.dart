import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/userprofilegrid_item_model.dart';
import 'package:hibiki_tamaki_s_application1/presentation/street_pass_screen/models/street_pass_model.dart';
part 'street_pass_state.dart';

final streetPassNotifier =
    StateNotifierProvider<StreetPassNotifier, StreetPassState>(
  (ref) => StreetPassNotifier(StreetPassState(
    streetPassModelObj: StreetPassModel(userprofilegridItemList: [
      UserprofilegridItemModel(
          userImage: ImageConstant.imgEllipse23,
          userName: "Dianne",
          idolImage: ImageConstant.img600x600bb44,
          idolText: "IDOL",
          yoasobiText: "YOASOBI"),
      UserprofilegridItemModel(
          userImage: ImageConstant.imgRectangle52,
          userName: "Russell",
          idolImage: ImageConstant.img600x600bb44140x140,
          idolText: "STOROBO",
          yoasobiText: "Vaundy"),
      UserprofilegridItemModel(
          userImage: ImageConstant.imgRectangle5236x36,
          userName: "Ross",
          idolImage: ImageConstant.img600x600bb441,
          idolText: "OVERDOSE",
          yoasobiText: "Natori")
    ]),
  )),
);

/// A notifier that manages the state of a StreetPass according to the event that is dispatched to it.
class StreetPassNotifier extends StateNotifier<StreetPassState> {
  StreetPassNotifier(StreetPassState state) : super(state) {}
}
