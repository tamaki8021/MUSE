// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'userprofilelist_item_model.dart';
import 'userprofilelist1_item_model.dart';

/// This class defines the variables used in the [chat_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ChatModel extends Equatable {
  ChatModel({
    this.userprofilelistItemList = const [],
    this.userprofilelist1ItemList = const [],
  }) {}

  List<UserprofilelistItemModel> userprofilelistItemList;

  List<Userprofilelist1ItemModel> userprofilelist1ItemList;

  ChatModel copyWith({
    List<UserprofilelistItemModel>? userprofilelistItemList,
    List<Userprofilelist1ItemModel>? userprofilelist1ItemList,
  }) {
    return ChatModel(
      userprofilelistItemList:
          userprofilelistItemList ?? this.userprofilelistItemList,
      userprofilelist1ItemList:
          userprofilelist1ItemList ?? this.userprofilelist1ItemList,
    );
  }

  @override
  List<Object?> get props =>
      [userprofilelistItemList, userprofilelist1ItemList];
}
