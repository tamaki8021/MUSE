// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// Firestoreの`Users`コレクションを表すモデル。
@freezed
class User with _$User {
  const factory User({
    /// Firestore上のユーザーID（ドキュメントID）
    required String userId,

    /// ユーザー名
    @Default('') String name,

    /// ユーザーの自己紹介文
    @Default('') String bio,

    /// プロフィール画像のURL
    @Default('') String profileImageUrl,

    /// ユーザー作成日時
    DateTime? createdAt,

    /// 最後にユーザー情報が更新された日時
    DateTime? updatedAt,
  }) = _User;

  /// JSONデータからDartオブジェクトを生成するためのファクトリ
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
