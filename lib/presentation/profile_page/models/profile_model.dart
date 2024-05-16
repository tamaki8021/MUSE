// ignore_for_file: must_be_immutable, comment_references

import 'package:equatable/equatable.dart';

import 'thirty_item_model.dart';
import 'userprofile1_item_model.dart';

/// This class defines the variables used in the [profile_page],
/// and is typically used to hold data that
/// is passed between different parts of the application.
class ProfileModel extends Equatable {
  ProfileModel({
    this.userprofile1ItemList = const [],
    this.thirtyItemList = const [],
  });

  List<Userprofile1ItemModel> userprofile1ItemList;

  List<ThirtyItemModel> thirtyItemList;

  ProfileModel copyWith({
    List<Userprofile1ItemModel>? userprofile1ItemList,
    List<ThirtyItemModel>? thirtyItemList,
  }) {
    return ProfileModel(
      userprofile1ItemList: userprofile1ItemList ?? this.userprofile1ItemList,
      thirtyItemList: thirtyItemList ?? this.thirtyItemList,
    );
  }

  @override
  List<Object?> get props => [userprofile1ItemList, thirtyItemList];
}
