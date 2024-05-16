// ignore_for_file: comment_references

import '../../../core/app_export.dart';

/// This class is used in the [userprofilelist_item_widget] screen.
class UserprofilelistItemModel {
  UserprofilelistItemModel({
    this.userImage2,
    this.userName,
    this.id,
  }) {
    userImage2 = userImage2 ?? ImageConstant.imgImage48x48;
    userName = userName ?? 'Tobey';
    id = id ?? '';
  }

  String? userImage2;

  String? userName;

  String? id;
}
