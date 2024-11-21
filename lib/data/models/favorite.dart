// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite.freezed.dart';
part 'favorite.g.dart';

/// Firestoreの`favorites`サブコレクションを表すモデル。
@freezed
class Favorite with _$Favorite {
  const factory Favorite({
    /// Firestore上のお気に入りID（ドキュメントID）
    required String favoriteId,

    /// お気に入りに登録した投稿のID
    required String postId,

    /// お気に入りに登録した日時
    DateTime? createdAt,
  }) = _Favorite;

  /// JSONデータからDartオブジェクトを生成するためのファクトリ
  factory Favorite.fromJson(Map<String, dynamic> json) =>
      _$FavoriteFromJson(json);
}
