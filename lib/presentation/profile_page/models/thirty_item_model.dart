// ignore_for_file: comment_references

import '../../../core/app_export.dart';

/// This class is used in the [thirty_item_widget] screen.
class ThirtyItemModel {
  ThirtyItemModel({
    this.xbb,
    this.id,
  }) {
    xbb = xbb ?? ImageConstant.img600x600bb32170x170;
    id = id ?? '';
  }

  String? xbb;

  String? id;
}
