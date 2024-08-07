// ignore_for_file: must_be_immutable, comment_references

// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'userprofile_item_model.dart';

/// This class defines the variables used in the [home_page],
/// and is typically used to hold data
/// that is passed between different parts of the application.
class HomeModel extends Equatable {
  HomeModel({this.userprofileItemList = const []});

  List<UserprofileItemModel> userprofileItemList;

  HomeModel copyWith({List<UserprofileItemModel>? userprofileItemList}) {
    return HomeModel(
      userprofileItemList: userprofileItemList ?? this.userprofileItemList,
    );
  }

  @override
  List<Object?> get props => [userprofileItemList];
}
