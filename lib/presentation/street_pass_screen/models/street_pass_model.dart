// ignore_for_file: must_be_immutable, comment_references

import 'package:equatable/equatable.dart';
import 'userprofilegrid_item_model.dart';

/// This class defines the variables used in the [street_pass_screen],
/// and is typically used to hold data that 
/// is passed between different parts of the application.
class StreetPassModel extends Equatable {
  StreetPassModel({this.userprofilegridItemList = const []});

  List<UserprofilegridItemModel> userprofilegridItemList;

  StreetPassModel copyWith(
      {List<UserprofilegridItemModel>? userprofilegridItemList,}) {
    return StreetPassModel(
      userprofilegridItemList:
          userprofilegridItemList ?? this.userprofilegridItemList,
    );
  }

  @override
  List<Object?> get props => [userprofilegridItemList];
}
