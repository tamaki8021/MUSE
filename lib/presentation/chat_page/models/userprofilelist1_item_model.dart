// ignore_for_file: comment_references

import '../../../core/app_export.dart';

/// This class is used in the [userprofilelist1_item_widget] screen.
class Userprofilelist1ItemModel {
  Userprofilelist1ItemModel({
    this.userImage,
    this.userName,
    this.timeAgo,
    this.id,
  }) {
    userImage = userImage ?? ImageConstant.imgRectangle5248x48;
    userName = userName ?? 'Dianne Russell';
    timeAgo = timeAgo ?? '12 min ago';
    id = id ?? '';
  }

  String? userImage;

  String? userName;

  String? timeAgo;

  String? id;
}
