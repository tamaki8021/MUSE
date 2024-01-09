import '../../../core/app_export.dart';

/// This class is used in the [userprofile1_item_widget] screen.
class Userprofile1ItemModel {
  Userprofile1ItemModel({
    this.friends,
    this.allText,
    this.id,
  }) {
    friends = friends ?? "Friends";
    allText = allText ?? "ALL";
    id = id ?? "";
  }

  String? friends;

  String? allText;

  String? id;
}
