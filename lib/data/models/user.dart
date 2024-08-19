// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    @Default('') String name,
    @Default('') String bio,
    @Default('') String profileImageUrl,
    @Default(0) int postCount,
  }) = _User;

  // json形式で受け取るためのコードを生成するために記述
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
