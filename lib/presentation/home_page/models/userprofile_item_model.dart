// ignore_for_file: comment_references

import '../../../core/app_export.dart';

/// This class is used in the [userprofile_item_widget] screen.
class UserprofileItemModel {
  UserprofileItemModel({
    this.userImage,
    this.userName,
    this.id,
  }) {
    userImage = userImage ?? ImageConstant.imgRectangle20;
    userName = userName ?? 'Eleanor';
    id = id ?? '';
  }

  String? userImage;

  String? userName;

  String? id;
}
