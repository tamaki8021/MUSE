// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:muse/data/models/post.dart';
import 'package:muse/data/models/user.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

@freezed
class PostWithUser with _$PostWithUser {
  const factory PostWithUser({
    required Post post,
    required User user,
  }) = _PostWithUser;

  factory PostWithUser.fromJson(Map<String, dynamic> json) =>
      _$PostWithUserFromJson(json);
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required List<PostWithUser> postWithUsers,
  }) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}
