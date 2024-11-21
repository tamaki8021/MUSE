// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow.freezed.dart';
part 'follow.g.dart';

/// Firestoreの`follows`または`followers`サブコレクションを表すモデル。
@freezed
class Follow with _$Follow {
  const factory Follow({
    /// フォローしている/フォローされているユーザーのID
    required String userId,

    /// フォローした日時
    DateTime? createdAt,
  }) = _Follow;

  /// JSONデータからDartオブジェクトを生成するためのファクトリ
  factory Follow.fromJson(Map<String, dynamic> json) => _$FollowFromJson(json);
}
